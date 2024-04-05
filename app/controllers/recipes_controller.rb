class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_authorization, only: [:edit, :update]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = current_user.recipes.build
  end

  def edit
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def check_authorization
      unless current_user == @recipe.user
        redirect_to recipes_path, alert: 'You are not authorized to edit this recipe.'
      end
    end

    def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :instructions, category_ids: [])
    end
end
