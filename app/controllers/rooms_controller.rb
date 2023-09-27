class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(params.require(:room).permit(:facility_name, :detail, :price, :address, :image))
    @room.id = current_user.id
    @room.save!
    redirect_to room_path(@room)
  end  

  def edit
  end


end
