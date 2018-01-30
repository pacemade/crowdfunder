require_relative '../test_helper'

class PledgeTest < ActiveSupport::TestCase

  test 'A pledge can be created' do
    pledge = create(:pledge,
      dollar_amount: 99.00,
      project: build(:project),
      user: build(:user)
    )
    assert pledge.valid?
    assert pledge.persisted?
  end

  test 'owner cannot back own project' do
    owner = create(:user)
    project = create(:project, user: owner)
    pledge = build(:pledge, user: owner, project: project)

    assert pledge.invalid?, 'Owner should not be able to pledge towards own project'
  end

end
