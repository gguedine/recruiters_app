class Recruiter < ApplicationRecord
  has_secure_password
  has_many :jobs
  # def password
  #   @password ||= Password.new(password)
  # end
  #
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password = @password
  # end
  #
  # validates :email, uniqueness: true, presence: true, allow_blank: false
  # validates :name, presence: true, allow_blank: false, format: { with: /\A[a-zA-Z0-9]+\z/ }
  # validates :password, presence: true, allow_blank: false
  #
  # def self.digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #            BCrypt::Engine.cost
  #   BCrypt::Password.create(string, cost: cost)
  # end

end
