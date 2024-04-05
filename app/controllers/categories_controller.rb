class CategoriesController < ApplicationController
  before_action :set_category, only: [:show] # Assuming you want to show recipes by category
  before_action :authenticate_user!, except: [:index, :show] # Optional: Require authentication for creating categories

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def show
    @recipes = @category.recipes # If you want to list recipes belonging to a category
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
