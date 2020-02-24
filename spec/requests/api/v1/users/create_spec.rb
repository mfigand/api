# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'create user requests' do
  describe 'POST /api/v1/users' do
    subject(:endpoint_call) { post '/api/v1/users', params: params }

    let(:email) { generate(:email) }
    let(:password) { '12345678' }
    let(:params) do
      { email: email, password: password }
    end
    let(:data_response) { JSON.parse(response.body)['data'] }

    context 'valid credentials' do
      it do
        subject
        expect(data_response).to include('email' => email)
        expect(response).to have_http_status(200)
      end
    end

    context 'invalid credentials' do
      let(:email) { '' }

      it do
        subject
        expect(data_response).to eq("Error: Validation failed: Email can't be blank")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
