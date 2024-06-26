# app/controllers/api/v1/recipes_controller.rb
module Api
  module V1
    class RecipesController < ApiController
      before_action :set_recipe, only: [:show, :update, :destroy]

      def index
        recipes = Recipe.all
        render json: recipes
      end

      def show
        render json: @recipe
      end

      def create
        recipe = @current_user.recipes.build(recipe_params)
        if recipe.save
          render json: recipe, status: :created
        else
          render json: recipe.errors, status: :unprocessable_entity
        end
      end

      def update
        if @recipe.update(recipe_params)
          render json: @recipe
        else
          render json: @recipe.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @recipe.destroy
        head :no_content
      end

      private

      def set_recipe
        @recipe = Recipe.find(params[:id])
      end

      def recipe_params
        params.require(:recipe).permit(:title, :ingredients, :instructions)
      end
    end
  end
end
