class AddRewardColumnToPledge < ActiveRecord::Migration[5.1]
  def change
    change_table :pledges do |t|
      t.belongs_to :reward
    end
  end
end
