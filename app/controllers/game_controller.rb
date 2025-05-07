class GameController < ApplicationController
  def index
    @player = Player.first_or_create(x: 2, y: 3, direction: 'west')

    room_id = Player::DUNGEON_LAYOUT[@player.y][@player.x]
    
    if room_id > 0
      @current_room = Room.find_by(id: room_id)
    else
      @current_room = nil # No room exists at this position
    end
  end

  def move
    @player = Player.first
    if params[:direction] == 'forward'
      @player.move_forward
    elsif params[:direction] == 'backward'
      @player.move_backward
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
