# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
      def authenticate
        authenticated = ::V1::AuthenticateInteractor.new(params[:email], params[:password]).resolve
        render json: { data: authenticated[:data] }, status: authenticated[:status]
      end      
    end
  end
end
