class Reward < ActiveRecord::Base
  belongs_to :project

  validate :reward_without_description
  validate :reward_without_dollar_amount

  def reward_without_description
    if self.description == nil
      errors.add(:base, "Reward should be invalid without a description")
    end
  end

  def reward_without_dollar_amount
    if self.dollar_amount == nil
      errors.add(:base, 'Reward should be invalid without dollar amount')
    end
  end
end
