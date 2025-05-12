class GameController < ApplicationController
  def index
    @player = Player.first_or_create(x: 1, y: 2, direction: "west")
    @current_room = DungeonLayout.room_at(@player.x, @player.y)
    @enemies = Enemy.where(x: @player.x, y: @player.y) # Get enemies in the same room
    @next_enemy = Enemy.next_enemy_for(@player)
  end
  def move
    @player = Player.first

    # Find the current room based on player position
    @current_room = DungeonLayout.room_at(@player.x, @player.y)

    # Check if the player can move in the specified direction
    if @current_room
      if params[:direction] == 'forward' && @current_room.possible_moves.include?(@player.direction)
        @player.move_forward
      elsif params[:direction] == 'backward' && @current_room.possible_moves.include?(@player.opposite_direction)
        @player.move_backward
      else
        flash[:error] = "You can't move in that direction from here!"
      end
    else
      flash[:error] = "No room at this location!"
    end

    @player.save
    redirect_to root_path
  end


  def turn
    @player = Player.first
    if params[:direction] == 'left'
      @player.turn_left
    elsif params[:direction] == 'right'
      @player.turn_right
    end
    @player.save
    redirect_to root_path
  end

end
