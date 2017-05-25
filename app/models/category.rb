class Category < ApplicationRecord
  validates_presence_of :name
  validates :amount, numericality: {greater_than: 0}, allow_nil: true

  has_many :budgets
  has_many :accounts, through: :budgets
end
