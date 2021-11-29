require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validations' do
    subject { build(:room) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:size) }
    it { should validate_presence_of(:bed_type) }
    it { should validate_presence_of(:facilities) }
    it { should validate_presence_of(:picture) }

    it { should validate_length_of(:name) }
    it { should validate_length_of(:city) }

    it { should validate_numericality_of(:size) }
    it { should validate_numericality_of(:price) }
  end

  describe 'associations' do
    subject { build(:room) }

    it { should have_many(:reservation) }
    it { should belong_to(:user) }
  end
end
