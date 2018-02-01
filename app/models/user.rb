class User < ActiveRecord::Base
  has_secure_password

  validates :password, length: { minimum: 8 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true

  has_many :projects
  has_many :pledges
  has_many :backed_projects, through: :pledges
  has_many :comments
  
  #  has_many :backed_projects, through: :pledges, class_name: 'Project', foreign_key: :project_id


  # def sum_of_pledges
  #   total = 0
  #   pledges.each do |pledge|
  #     total += pledge.dollar_amount
  #   end
  #   return total
  # end

  # def sum_of_pledges
  #   pledges.sum do |pledge|
  #     pledge.dollar_amount
  #   end
  # end

  # def sum_of_pledges
  #   pledges.sum(&:dollar_amount)
  # end

  def sum_of_pledges
    # pledges.sum(&:dollar_amount)
    pledges.pluck(:dollar_amount).sum
  end

end
