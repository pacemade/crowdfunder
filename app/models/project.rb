class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner
  has_many :progress_updates

  validates :title, :description, :goal, :start_date, :end_date, presence: true

  def already_pledged?(user)
    # user_ids.include?(user.id)
    users.include?(user)
  end
end
