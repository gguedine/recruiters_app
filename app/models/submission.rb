class Submission < ApplicationRecord
  belongs_to :job

  validates :name, :email, :mobile_phone, :resume, presence: true
  validates :job_id, uniqueness: {scope: [:email]}

end
