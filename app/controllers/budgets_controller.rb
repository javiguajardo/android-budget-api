class BudgetsController < ApplicationController
  def index
    categories = Category.all
    categories.each do |category|
      category[:total_amount] = category.amount - category.expenses.map {|e| e.amount}.sum
    end

    @budgets_json = {
        categories: categories
    }

    render json: @budgets_json
  end
end
