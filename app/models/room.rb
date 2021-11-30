class Room < ApplicationRecord
  belongs_to :user
  has_many :reservation
end
