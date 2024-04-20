module Api
  module V1
    class SessionsController < Devise::SessionsController
      skip_before_action :verify_authenticity_token
      respond_to :json

      def create
        user = User.find_by(email: params[:user][:email])
        if user&.valid_password?(params[:user][:password])
          token = JwtService.encode({ user_id: user.id })
          render json: { jwt: token }, status: :created
        else
          render json: { error: 'invalid credentials' }, status: :unauthorized
        end
      end

      def destroy
        super
      end
    end
  end
end
