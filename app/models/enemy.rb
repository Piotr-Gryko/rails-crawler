class Enemy < ApplicationRecord
  validates :x, :y, :name, :direction, presence: true

  def self.next_enemy_for(player)
    # Get the player's current room
    current_room = DungeonLayout.room_at(player.x, player.y)

    # Check if movement is allowed in the direction the player is facing
    if current_room && current_room.possible_moves.include?(player.direction)
      # Get the next position based on the player's direction
      dx, dy = case player.direction
               when 'north' then [0, -1]
               when 'east'  then [1, 0]
               when 'south' then [0, 1]
               when 'west'  then [-1, 0]
               end

      # Calculate the coordinates of the next room
      next_x = player.x + dx
      next_y = player.y + dy

      # Check if there's an enemy in the next room
      next_enemy = Enemy.find_by(x: next_x, y: next_y)

      next_enemy # Return the enemy, or nil if no enemy is found
    end
  end
end
