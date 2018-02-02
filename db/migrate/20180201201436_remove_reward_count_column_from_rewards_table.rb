class RemoveRewardCountColumnFromRewardsTable < ActiveRecord::Migration[5.1]
  def up
    remove_column :rewards, :reward_count
  end

  def down
    add_column :rewards, :reward_count, :integer
  end
end
