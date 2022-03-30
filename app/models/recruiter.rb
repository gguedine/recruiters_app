class Recruiter < ApplicationRecord
  has_secure_password
  has_many :jobs

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, allow_blank: false, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  validates :password, presence: true

end
