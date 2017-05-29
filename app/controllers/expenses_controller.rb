class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :update, :destroy]

  # GET /expenses
  def index
    expenses = Expense.all

    total_expenses = expenses.map {|a| a.amount}.sum

    @expenses_json = {
        expenses: expenses,
        total_expenses: total_expenses
    }

    render json: @expenses_json
  end

  # GET /expenses/1
  def show
    render json: @expense
  end

  # POST /expenses
  def create
    @expense = Expense.new(expense_params)
    @expense.category_id = Category.find_by_name(params[:category_id]).id

    if @expense.save
      render json: @expense, status: :created, location: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/1
  def update
    @expense.category_id = Category.find_by_name(params[:category_id]).id

    expense_params[:category_id] = @expense.category_id
    p "=============== #{expense_params.inspect}"
    if @expense.update(expense_params)
      render json: @expense
    else
      p "================ #{@expense.errors.full_messages}"
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /expenses/1
  def destroy
    @expense.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def expense_params
      params.require(:expense).permit(:expense_date, :store, :amount, :category_id)
    end
end
