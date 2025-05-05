class Player < ApplicationRecord
  validates :x, :y, :direction, presence: true

  DIRECTIONS = %w[north east south west].freeze

  def turn_left
    self.direction = DIRECTIONS[(DIRECTIONS.index(direction) - 1) % DIRECTIONS.size]
  end

  def turn_right
    self.direction = DIRECTIONS[(DIRECTIONS.index(direction) + 1) % DIRECTIONS.size]
  end

  def move_forward
    case direction
    when "north" then self.y -= 1
    when "south" then self.y += 1
    when "east"  then self.x += 1
    when "west"  then self.x -= 1
    end
  end

  def move_backward
    case direction
    when "north" then self.y += 1
    when "south" then self.y -= 1
    when "east"  then self.x -= 1
    when "west"  then self.x += 1
    end
  end
end
