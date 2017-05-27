# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string
#  acct_type  :integer          default("0")
#  amount     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ApplicationRecord
  validates_presence_of :name, :acct_type, :amount
  validates_uniqueness_of :name
  validates :amount, numericality: {greater_than: 0}
  enum acct_type: [:cheque, :ahorro, :efectivo]
end
