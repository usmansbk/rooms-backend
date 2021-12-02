class Room < ApplicationRecord
  validates :name, :city, length: { maximum: 100 }
  validates :name, :city, :price, :size, :bed_type, :facilities, :picture, presence: true
  validates :size, :price, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :user
  has_many :reservations
  has_one_attached :picture do |attachable|
    attachable.variant :thumb, resize: '300x300'
  end
end
