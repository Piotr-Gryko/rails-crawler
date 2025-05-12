class Room < ApplicationRecord
  validates :x, :y, presence: true

  def possible_moves
    YAML.load(self[:possible_moves]) || []
  rescue Psych::SyntaxError, TypeError
    []
  end

  def possible_moves=(value)
    self[:possible_moves] = value.to_yaml
  end

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
