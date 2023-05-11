class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitivity: false }, length: { minimum: 3, maximum: 20 }
  has_secure_password

  has_many :messages
end
