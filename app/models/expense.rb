class Expense < ApplicationRecord
  validates_presence_of :store, :amount, :category_id
  validates :amount, numericality: {greater_than: 0}

  belongs_to :category
end
