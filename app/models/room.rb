class Room < ApplicationRecord
  validates :x, :y, :north_image, :south_image, :east_image, :west_image, presence: true

  # Assuming you have attributes like 'north_image', 'south_image', etc.
  # These should return the image filenames (e.g., 'north_0_1.jpg')

  def north_image
    "#{self.id}_north.jpg"
  end

  def south_image
    "#{self.id}_south.jpg"
  end

  def east_image
    "#{self.id}_east.jpg"
  end

  def west_image
    "#{self.id}_west.jpg"
  end
end
