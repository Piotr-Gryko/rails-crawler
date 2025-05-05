class GameController < ApplicationController
  def index
    @player = Player.first_or_create(x: 0, y: 0, direction: "north")
    @current_room = Room.find_by(x: @player.x, y: @player.y)
  end

  def move
    @player = Player.first
    if params[:direction] == "forward"
      @player.move_forward
    elsif params[:direction] == "backward"
      @player.move_backward
    end
    @player.save
    redirect_to root_path
  end

  def turn
    @player = Player.first
    if params[:direction] == "left"
      @player.turn_left
    elsif params[:direction] == "right"
      @player.turn_right
    end
    @player.save
    redirect_to root_path
  end
end
