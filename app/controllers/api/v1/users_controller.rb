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

      def show        
        shown = ::V1::Users::ShowInteractor.new(current_user,
                                                save_params[:id]).show
        render json: { data: shown[:data] }, status: shown[:status]
      end

      def update
        updated = ::V1::Users::UpdateInteractor.new(current_user,
                                                    save_params[:id],
                                                    update_params).update
        render json: { data: updated[:data] }, status: updated[:status]
      end

      def destroy
        destroyed = ::V1::Users::DestroyInteractor.new(current_user,
                                                       save_params[:id]).destroy
        render json: { data: destroyed[:data] }, status: destroyed[:status]
      end

      private

      def save_params
        params.permit(:id, :name, :lastname, :email, :password)
      end

      def update_params
        to_update = save_params.to_hash
        to_update.delete('id')
        to_update
      end
    end
  end
end
