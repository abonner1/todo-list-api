class User < ApplicationRecord
  has_secure_password
  has_many :todo_lists

  validates :email, presence: true
  validates :email, uniqueness: true
end
