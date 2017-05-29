class BudgetsController < ApplicationController
  def index
    categories = Category.all
    categories.each do |category|
      category[:total_amount] = category.amount - category.expenses.map {|e| e.amount}.sum
    end

    cash_flow = Account.all.map {|a| a.amount}.sum - Expense.all.map {|e| e.amount}.sum

    @budgets_json = {
        categories: categories,
        cash_flow: cash_flow
    }

    render json: @budgets_json
  end
end
