require 'test_helper'

class RewardTest < ActiveSupport::TestCase

  test 'A reward can be created' do
    owner = create(:user)
    project = create(:project, user: owner)
    reward = create(:reward, project: project)

    assert reward.valid?
    assert reward.persisted?
  end

  test 'A reward cannot be created without a dollar amount' do
    owner = create(:user)
    project = create(:project, user: owner)
    reward = build(:reward, dollar_amount: nil)

    assert reward.invalid?, 'Reward should be invalid without dollar amount'
    assert reward.new_record?, 'Reward should not save without dollar amount'
  end

  test 'A reward cannot be created without a description' do
    owner = create(:user)
    project = create(:project, user: owner)
    reward = build(:reward, description: nil)

    assert reward.invalid?, 'Reward should be invalid without a description'
    assert reward.new_record?, 'Reward should not save without a description'
  end

  test 'A reward description is returned when dollar amount pledged meets reward dollar amount' do
    owner = create(:user)
    backer = create(:user)
    project = create(:project, user: owner)
    reward = create(:reward, project: project, dollar_amount: 100, description: "Snitches get stitches")
    pledge = create(:pledge, user: backer, dollar_amount: 100, project: project)

    actual = pledge.reward_check.description
    expected = "Snitches get stitches"
    assert_equal(expected, actual)
  end
end
