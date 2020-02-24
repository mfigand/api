# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'delete user requests' do
  describe 'DELETE /api/v1/users/:id' do
    subject(:endpoint_call) { delete "/api/v1/users/#{id}", headers: { 'Authentication' => auth_token } }

    let(:user_to_delete) { create(:user) }
    let(:id) { user_to_delete.id }
    let(:current_user) { create(:user) }
    let(:auth_token) { JsonWebToken.encode(user_id: current_user.id) }

    before do
      user_to_delete
      current_user
    end

    context 'valid token' do
      it do
        expect { subject }.to change { User.count }.by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'cant find user_to_delete' do
      let(:id) { '0' }
      it do
        expect { subject }.to change { User.count }.by(0)
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'invalid token' do
      let(:auth_token) { '' }

      it do
        subject
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
