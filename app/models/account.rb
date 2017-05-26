class Account < ApplicationRecord
  validates_presence_of :name, :acct_type, :amount
  validates_uniqueness_of :name
  validates :amount, numericality: {greater_than: 0}
  enum acct_type: [:checking, :savings, :cash]
end
