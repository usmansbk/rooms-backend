class Room < ApplicationRecord
  validates :name, :city, length: { maximum: 100 }
  validates :name, :city, :price, :size, :bed_type, :facilities, :picture, presence: true
  validates :size, :price, numericality: { greater_than: 0 }

  belongs_to :user
  has_many :reservations
end
