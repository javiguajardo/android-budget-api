class BudgetsController < ApplicationController
  def index
    @categories = Category.all

    render json: @categories
  end
end
