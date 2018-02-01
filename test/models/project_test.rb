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

end
