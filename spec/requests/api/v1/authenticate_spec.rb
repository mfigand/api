# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'authenticate requests' do
  describe 'POST /authenticate' do
    subject(:endpoint_call) { post '/api/v1/authenticate', params: params }

    let(:user) { create(:user) } 
    let(:params) do
      { email: user.email, password: user.password}
    end
    let(:auth_token) { JsonWebToken.encode(user_id: user.id) }

    it do
      subject
      expect(response.body).to eq({ data: auth_token }.to_json)
    end
  end
end
