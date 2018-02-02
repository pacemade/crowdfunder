class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges

  validates :dollar_amount, :description, presence: true

  def all_claimed?
    reward_max == pledges.count 
  end

end
