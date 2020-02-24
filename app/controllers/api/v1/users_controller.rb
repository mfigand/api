# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user, except: [:create]

      def create
        created = ::V1::Users::CreateInteractor.new(save_params[:email],
                                                    save_params[:password]).create
        render json: { data: created[:data] }, status: created[:status]
      end

      def destroy
        destroyed = ::V1::Users::DestroyInteractor.new(save_params[:id]).destroy
        render json: { data: destroyed[:data] }, status: destroyed[:status]
      end

      private

      def save_params
        params.permit(:id, :email, :password)
      end
    end
  end
end
