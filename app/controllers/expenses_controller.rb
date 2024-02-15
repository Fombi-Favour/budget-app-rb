class ExpensesController < ApplicationController
  load_and_authorize_resource

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user

    if @expense.save
      redirect_to category_path(@expense.categories.first.id), notice: 'Expense was successfully created'
    else
      render new_expense_path, alert: 'Failed to create expense'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, category_ids: [])
  end
end
