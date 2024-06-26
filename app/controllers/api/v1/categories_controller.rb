module Api
  module V1
    class CategoriesController < ApiController
      def index
        categories = Category.all
        render json: categories
      end

      def show
        category = Category.find(params[:id])
        render json: category
      end
    end
  end
end
