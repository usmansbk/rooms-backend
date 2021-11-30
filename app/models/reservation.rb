class Reservation < ApplicationRecord
  validates :nights, :check_in, presence: true
  validates :nights, numericality: { greater_than: 0 }

  belongs_to :user
  belongs_to :room
end
