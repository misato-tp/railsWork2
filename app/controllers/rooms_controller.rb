class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:facility_name, :detail, :price, :address, :image, :room_id))
    if @room.save
      redirect_to room_path(@room)
    else
      redirect_to room_path(@room)
    end
  end  

  def edit
  end

  def own
    @rooms = Room.all
  end
end
