class Player < ApplicationRecord
  validates :x, :y, :direction, presence: true

  DIRECTIONS = %w[north east south west].freeze

  def opposite_direction
    case direction
    when 'north' then 'south'
    when 'south' then 'north'
    when 'east'  then 'west'
    when 'west'  then 'east'
    end
  end

  def turn_left
    self.direction = DIRECTIONS[(DIRECTIONS.index(direction) - 1) % DIRECTIONS.size]
  end

  def turn_right
    self.direction = DIRECTIONS[(DIRECTIONS.index(direction) + 1) % DIRECTIONS.size]
  end

  def move_forward
    return puts "No current room!" unless current_room

    if current_room.possible_moves.include?(direction)
      dx, dy = movement_delta
      new_x = x + dx
      new_y = y + dy

      self.x = new_x
      self.y = new_y
      save
      puts "Moved forward to x=#{x}, y=#{y}, facing #{direction}"
    else
      puts "You can't move #{direction} from here!"
    end
  end

  def move_backward
    return puts "No current room!" unless current_room

    if current_room.possible_moves.include?(opposite_direction)
      dx, dy = movement_delta
      new_x = x - dx
      new_y = y - dy

      self.x = new_x
      self.y = new_y
      save
      puts "Moved backward to x=#{x}, y=#{y}, facing #{direction}"
    else
      puts "You can't move backward from here!"
    end
  end

  def movement_delta
    case direction
    when 'north' then [0, -1]
    when 'east'  then [1, 0]
    when 'south' then [0, 1]
    when 'west'  then [-1, 0]
    end
  end

  def valid_move?(new_x, new_y)
    Room.exists?(x: new_x, y: new_y)
  end

  def current_room
    Room.find_by(x: x, y: y)
  end
end