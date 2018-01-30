require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test 'valid project can be created' do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.save
    assert project.valid?
    assert project.persisted?
    assert project.user
  end

  test 'project is invalid without owner' do
    project = new_project
    project.user = nil
    project.save
    assert project.invalid?, 'Project should not save without owner.'
  end

  def new_project
    Project.new(
      title:       'Cool new boardgame',
      description: 'Trade sheep',
      start_date:  Date.today,
      end_date:    Date.today + 1.month,
      goal:        50000
    )
  end

  def new_user
    User.new(
      first_name:            Faker::Name.first_name,
      last_name:             'Lowenthal',
      email:                 Faker::Internet.free_email,
      password:              'passpass',
      password_confirmation: 'passpass'
    )
  end

  def test_already_pledge_returns_true
    user = new_user
    user.save!
    user2 = new_user
    user2.save!
    project = new_project
    project.user = user
    project.save!
    pledge = Pledge.new(
      dollar_amount: 100,
      user: user2,
      project: project
    )
    pledge.save!

    actual = project.already_pledged?(user2)
    expected = true

    assert_equal(expected, actual)
  end
end
