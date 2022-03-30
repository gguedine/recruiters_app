class Job < ApplicationRecord
  include Filterable

  enum status: {
    active: 0,
    inactive: 1,
  }

  belongs_to :recruiter
  has_many :submissions, dependent: :delete_all

  validates :title, :description, :start_date, :end_date, :status, :skills,
            presence: true

  scope :active, -> { where(status: :active) }
end
