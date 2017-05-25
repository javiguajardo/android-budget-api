class Category < ApplicationRecord
  validates_presence_of :name, :amount
  validates :amount, numericality: {greater_than: 0}
  has_many :accounts, through: :budget
end
