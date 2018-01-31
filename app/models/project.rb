class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner

  validates :user_id, :title, :description, :goal, :start_date, :end_date, presence: true


  def self.search(term)
    if term
      where("title ILIKE ?", "%#{term}%")
    else
      all
    end
  end

end
