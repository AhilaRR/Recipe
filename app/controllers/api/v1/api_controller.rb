# app/controllers/api/v1/api_controller.rb
module Api
  module V1
    class ApiController < ActionController::API
      include ActionController::MimeResponds
      before_action :authenticate_request!

      private

      def authenticate_request!
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          @decoded = JwtService.decode(header)
          @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound, JWT::DecodeError
          render json: { errors: 'Unauthorized' }, status: :unauthorized
        end
      end
    end
  end
end
