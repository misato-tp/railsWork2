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
    if @room.save
      room = Room.find_by(facility_name: @room.facility_name)
      redirect_to room_path(room.id)
    else
      render :new
    end
  end  

  def edit
  end

end
