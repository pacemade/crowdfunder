class AddRewardCountAndLimitColumnToReward < ActiveRecord::Migration[5.1]
  def change
    add_column :rewards, :reward_count, :integer, default: 0
    add_column :rewards, :reward_max, :integer, default: 0
  end
end
