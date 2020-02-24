# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:params) do
    { email: generate(:email), password: '12345678' }
  end

  describe '#create' do
    it do
      post :create, params: params
      expect(response.status).to eq(200)
    end
  end
end
