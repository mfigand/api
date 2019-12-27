class Api::V1::PingController < ApplicationController
  def ping
    # render json: { data: 'ok' }
    render json: { data: 'pong' }, status: 200
  end
end
