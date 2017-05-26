class Account < ApplicationRecord
  validates_presence_of :name, :acct_type, :amount
  validates_uniqueness_of :name
  validates :amount, numericality: {greater_than: 0}
  enum acct_type: [:checking, :savings, :cash]

  belongs_to :budget

  before_validation :add_default_budget

  protected
  def add_default_budget
    self.budget_id = Budget.find(1).id
  end
end
