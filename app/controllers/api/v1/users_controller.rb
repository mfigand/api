# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        created = {}
        render json: { data: created[:data] }, status: created[:status]
      end
    end
  end
end
