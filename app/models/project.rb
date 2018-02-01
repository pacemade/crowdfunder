class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner
  has_many :progress_updates

  validates :user_id, :title, :description, :goal, :start_date, :end_date, presence: true
  belongs_to :category


  def self.search(term)
    # @projects = Project.term(params)
    if term
      where("title ILIKE ?", "%#{term}%")
    else
      all
    end
  end

end
