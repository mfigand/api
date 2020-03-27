# frozen_string_literal: true

module V1
  module Users
    class CreateInteractor
      def initialize(email, password, role_id)
        @email = email
        @password = password
        @role_id = role_id
      end

      def create
        if user&.try(:authenticate, @password)
          { data: ::V1::Users::ShowPresenter.new(user).serialize, status: 200 }
        else
          { data: "Error: #{user[:error]}", status: :unprocessable_entity }
        end
      end

      private

      def user
        @user ||= ::V1::Users::CreateRepository.new(@email, @password, @role_id).create
      end
    end
  end
end
