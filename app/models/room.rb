class Room < ApplicationRecord
  validates :x, :y, :north_image, :south_image, :east_image, :west_image, presence: true

  # Assuming you have attributes like 'north_image', 'south_image', etc.
  # These should return the image filenames (e.g., 'north_0_1.jpg')

  def north_image
    "#{self.id}_north.png"
  end

  def south_image
    "#{self.id}_south.png"
  end

  def east_image
    "#{self.id}_east.png"
  end

  def west_image
    "#{self.id}_west.png"
  end
end
