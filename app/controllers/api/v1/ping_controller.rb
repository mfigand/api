class Api::V1::PingController < ApplicationController
  def ping
    render json: { data: 'ok' }
  end
end
