class TodoList < ApplicationRecord
  belongs_to :user
  has_many :todos
end
