class Account < ApplicationRecord
  validates_presence_of :name, :type, :amount
  validates :amount, numericality: {greater_than: 0}
  enum type: [:checking, :savings, :cash]
end
