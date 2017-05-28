# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  name         :string
#  amount       :float
#  total_amount :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Category < ApplicationRecord
  validates_presence_of :name, :amount
  validates :amount, numericality: {greater_than: 0}

  has_many :expenses, dependent: :destroy
end
