class Account < ApplicationRecord
  validates_presence_of :name, :acct_type, :amount
  validates :amount, numericality: {greater_than: 0}
  enum acct_type: [:checking, :savings, :cash]

  has_one :budget
end
