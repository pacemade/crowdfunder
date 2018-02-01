class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :backed_project, class_name: 'Project', foreign_key: :project_id

  validates :dollar_amount, presence: true
  validates :dollar_amount, :numericality => { greater_than: 0 }
  validates :user, presence: true
  validate :owner_cannot_back

  def owner_cannot_back
    if project && user == project.user
      errors.add(:base, "Owner should not be able to pledge towards own project")
    end
  end

  def reward_check
    project.rewards.order(dollar_amount: :desc).map do |reward|
      next if reward.reward_count == reward.reward_max
        # add error to flash "All instances of #{reward.description} have been claimed!"
      if dollar_amount >= reward.dollar_amount && reward.reward_count != reward.reward_max
        reward.increment(:reward_count).save
        return reward.description
      end
    end
    return   "All of the rewards for this project have been claimed!"
  end


end
