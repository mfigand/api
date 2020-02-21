# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
      def authenticate
        binding.pry

        authenticated = JsonWebToken.encode(user_id: user.id)  if user

        if authenticated
          render json: { auth_token: authenticated }
        else
          render json: { error: authenticated.errors }, status: :unauthorized
        end
      end

      private

      def user
        user = User.find_by_email(params[:email])

        return user if user && user.authenticate(password)

        errors.add :user_authentication, 'invalid credentials'
        nil
      end
    end
  end
end