require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    subject { build(:reservation) }

    it { should validate_presence_of(:nights) }
    it { should validate_presence_of(:check_in) }

    it { should validate_numericality_of(:nights) }
  end

  describe 'associations' do
    subject { build(:reservation) }

    it { should belong_to(:room) }
    it { should belong_to(:user) }
  end
end
