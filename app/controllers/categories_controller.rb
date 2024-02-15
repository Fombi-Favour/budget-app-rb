class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = current_user.categories.order(:created_at)
  end

  def show
    @category = Category.includes(:expenses).find(params[:id])
    @expenses = @category.recent_expenses
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to authenticated_root_path, notice: 'Category was successfully created'
    else
      render new_category_path, notice: 'Category was not created'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
