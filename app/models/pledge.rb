class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :backed_project, class_name: 'Project', foreign_key: :project_id

  validates :dollar_amount, presence: true
  validates :user, presence: true
  validate :owner_cannot_back

  def owner_cannot_back
    if project && user == project.user
      errors.add(:base, "Owner should not be able to pledge towards own project")
    end
  end
end
