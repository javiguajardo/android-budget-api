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

  before_save :send_notification

  protected
  def send_notification
    category_amount = self.category.amount
    category_expenses = self.category.expenses.map {|e| e.amount}.sum
    expense_category = self.category.name

    if category_amount < category_expenses
      android_notification("Presupuesto de #{expense_category}",
                           "Se ha pasado de presupuesto por $#{category_amount - category_expenses}")
    end
  end

  def android_notification(message_title, message_body)
    api_key ='AIzaSyD_8f5CLhfRqnlCtNI3gTCaEt-dszkJeAs'

    message_title = message_title
    message_body = message_body
    path = 'https://gcm-http.googleapis.com/gcm/send'

    data={
        "to": '/topics/budget_spent',
        "notification": {
            "body": message_body,
            "title": message_title,
        }
    }

    data_as_json = data.to_json


    @result = HTTParty.post(path,
                            body: data_as_json,
                            headers: {'Authorization' => 'key=' + api_key, 'Content-Type' => 'application/json'}
    )
  end
end
