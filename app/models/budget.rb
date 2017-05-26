class Budget < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :categories, dependent: :destroy
end
