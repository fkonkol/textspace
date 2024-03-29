require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }

    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }

    it { should validate_presence_of(:password_confirmation) }
  end

  describe 'associations' do
  end
end
