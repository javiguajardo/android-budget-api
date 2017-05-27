# == Schema Information
#
# Table name: expenses
#
#  id           :integer          not null, primary key
#  expense_date :date
#  store        :string
#  amount       :float
#  category_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Expense < ApplicationRecord
  validates_presence_of :store, :amount, :category_id
  validates :amount, numericality: {greater_than: 0}

  belongs_to :category
end
