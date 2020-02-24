# frozen_string_literal: true

class ApplicationController < ActionController::API
  def authenticate_user
    @auth_token = JsonWebToken.decode(request.headers[:Authentication])
    render json: true, status: :unauthorized unless @auth_token
  end

  def current_user
    @current_user ||= if @auth_token
                        user_id = JsonWebToken.decode(@auth_token)[:user_id]
                        ::V1::Users::FindRepository.new({ id: user_id }).find
                      end
  end
end
