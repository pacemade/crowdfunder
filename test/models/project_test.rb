require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test 'valid project can be created' do
    owner = create(:user)
    project = create(:project, user: owner)
    assert project.valid?
    assert project.persisted?
    assert project.user
  end

  test 'project is invalid without owner' do
    project = build(:project, user: nil)
    assert project.invalid?, 'Project should not save without owner.'
  end

  def test_already_pledge_returns_true
    owner = create(:user)
    backer = create(:user)
    project = create(:project, user: owner)
    pledge = create(:pledge, user: backer, project: project)

    actual = project.already_pledged?(backer)
    expected = true

    assert_equal(expected, actual)
  end
end
