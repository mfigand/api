# frozen_string_literal: true

module V1
  module Users
    class ShowInteractor
      def initialize(current_user, id)
        @current_user = current_user
        @id = id
      end

      def show
        return ErrorService.new(user[:error], :not_found).create unless user.instance_of?(User)
        return ApplicationPolicy.unauthorized_error unless allowed?

        { data: ::V1::Users::ShowPresenter.new(user).serialize, status: 200 }
      end

      private

      def allowed?
        UserPolicy.new(@current_user, user).show?
      end

      def user
        @user ||= ::V1::Users::FindRepository.new({ id: @id }).find
      end
    end
  end
end
