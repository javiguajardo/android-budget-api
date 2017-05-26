class Category < ApplicationRecord
  validates_presence_of :name, :amount
  validates :amount, numericality: {greater_than: 0}

  has_many :expenses, dependent: :destroy
  belongs_to :budget

  before_validation :add_default_budget

  protected
  def add_default_budget
    self.budget_id = Budget.find(1).id
  end
end
