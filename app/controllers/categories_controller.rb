class CategoriesController < ApplicationController
  before_action :find_category, only: %i[edit update]

  def index
    @categories = Category.all.order(:priority)
  end

  def show; end

  def new
    @category = Category.new
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'User successfully updated'
    else
      redirect_to edit_category_path(@category), notice: 'An error ocurred while updating this user'
    end
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to root_path, notice: 'Category create successfully'
    else
      render new_category_path, notice: 'An error occurred'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
