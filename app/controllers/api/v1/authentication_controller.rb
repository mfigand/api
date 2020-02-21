# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
      def authenticate
        render json: { data: authenticated[:data] }, status: authenticated[:status]
      end

      private

      def authenticated
        if user && user.authenticate(params[:password])
          { data: JsonWebToken.encode(user_id: user.id), status: 200 }
        else
          { data: 'invalid credentials', status: :unauthorized}
        end
      end

      def user
        @_user ||= User.find_by_email(params[:email])
      end
    end
  end
end