class Room < ApplicationRecord
  validates :x, :y, :north_image, :south_image, :east_image, :west_image, presence: true
end
