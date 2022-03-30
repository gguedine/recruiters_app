class Recruiter < ApplicationRecord
  has_secure_password
  has_many :jobs

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, format: { with: /\A[^0-9`!@#$%\^&*+_=]+\z/ }
  validates :password, presence: true, on: :create
end
