# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        created = ::V1::Users::CreateInteractor.new(save_params[:email],
                                                    save_params[:password]).create
        render json: { data: created[:data] }, status: created[:status]
      end

      private

      def save_params
        params.permit(:email, :password)
      end
    end
  end
end
