# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { build(:role) }

  describe 'validations' do
    it 'Create a valid' do
      expect(create(:role)).to be_valid
    end

    it 'Invalidwithout a name' do
      expect(build(:role, name: nil)).not_to be_valid
    end
  end
end
