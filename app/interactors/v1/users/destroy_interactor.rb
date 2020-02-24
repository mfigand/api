# frozen_string_literal: true

module V1
  module Users
    class DestroyInteractor
      def initialize(id)
        @id = id
        @error = nil
        @status = nil
        @user = nil
      end

      def destroy
        if user.instance_of?(User) && policy
          { data: ::V1::Users::DestroyRepository.new(user).destroy, status: :no_content }
        else
          { data: "Error: #{@error}", status: @status }
        end
      end

      private

      def policy
        # UserPolicy.new(current_user, user).destroy?
        true
      end

      def user
        return @user if @user

        user = ::V1::Users::FindRepository.new({ id: @id }).find
        if user.instance_of?(User)
          @user = user
        else
          @error = user[:error]
          @status = :not_found
        end
      end
    end
  end
end
