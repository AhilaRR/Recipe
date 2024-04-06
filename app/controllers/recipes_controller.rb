class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
  end

  # GET /recipes/new
  def new
    @recipe = current_user.recipes.build
  end

  # GET /recipes/1/edit
  def edit
    # Ensure only the creator can edit the recipe
    redirect_to recipes_path, alert: "You are not authorized to edit this recipe." unless own_recipe?(@recipe)
  end

  # POST /recipes
  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if own_recipe?(@recipe) && @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit, alert: "You are not authorized to update this recipe."
    end
  end

  # DELETE /recipes/1
  def destroy
    if own_recipe?(@recipe)
      @recipe.destroy
      redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
    else
      redirect_to recipes_url, alert: "You are not authorized to delete this recipe."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :instructions, :categories_list)
    end

    # Check if the current_user is the owner of the recipe
    def own_recipe?(recipe)
      current_user == recipe.user
    end
end
