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

<<<<<<< HEAD
  # test 'A reward description is returned when dollar amount pledged meets reward dollar amount' do
  #   owner = create(:user)
  #   backer = create(:user)
  #   project = create(:project, user: owner)
  #   reward = create(:reward, project: project, dollar_amount: 100, description: "Snitches get stitches")
  #   pledge = create(:pledge, user: backer, dollar_amount: 100, project: project)
  #
  #   actual = pledge.reward_check.description
  #   expected = "Snitches get stitches"
  #   assert_equal(expected, actual)
  # end
=======
  test 'A reward description is returned when dollar amount pledged meets reward dollar amount' do
    owner = create(:user)
    backer = create(:user)
    project = create(:project, user: owner)
    reward = create(:reward, project: project, dollar_amount: 100, description: "Snitches get stitches", reward_max: 100)
    pledge = create(:pledge, user: backer, dollar_amount: 100, project: project)

    actual = pledge.reward_check
    expected = "Snitches get stitches"
    assert_equal(expected, actual)
  end

  test "reward_check returns second reward if first reward count is maxed" do
    owner = create(:user)
    backer = create(:user)
    project = create(:project, user: owner)
    reward1 = create(:reward, project: project, dollar_amount: 100, description: "Snitches get stitches", reward_count: 10, reward_max:10)
    reward2 = create(:reward, project: project, dollar_amount: 50, description: "Second description", reward_max: 100)
    pledge = create(:pledge, user: backer, dollar_amount: 100, project: project)

    actual = pledge.reward_check
    expected = "Second description"

    assert_equal(expected, actual)
  end

  test "reward_check returns msg if reward max is full and no rewards available" do
    owner = create(:user)
    backer = create(:user)
    project = create(:project, user: owner)
    reward = create(:reward, project: project, dollar_amount: 100, description: "Snitches get stitches", reward_count: 10, reward_max:10)
    reward2 = create(:reward, project: project, dollar_amount: 100, description: "Second description", reward_count: 10, reward_max:10)
    pledge = create(:pledge, user: backer, dollar_amount: 100, project: project)

    actual = pledge.reward_check
    expected = "All of the rewards for this project have been claimed!"

    assert_equal(expected, actual)
  end

>>>>>>> 76c62534cf44ee211b768252f25c056115e2e860
end
