class Budget < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_and_belongs_to_many :categories
end
