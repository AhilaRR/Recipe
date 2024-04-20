# app/controllers/api/v1/registrations_controller.rb
module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      skip_before_action :verify_authenticity_token
      respond_to :json

      def create
        build_resource(sign_up_params)

        resource.save
        if resource.persisted?
          if resource.active_for_authentication?
            render json: { status: 'success', message: 'Signed up successfully.' }, status: :created
          else
            render json: { status: 'success', message: "Signed up successfully. Please verify your account." }, status: :ok
          end
        else
          render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
