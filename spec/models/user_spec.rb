require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:name) }

    it { should validate_length_of(:name) }
  end

  describe 'associations' do
    subject { build(:user) }

    it { should have_many(:room) }

    it { should have_many(:reservation) }
  end
end
