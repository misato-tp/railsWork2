class RoomsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def search
    @results = @q.result
  end

  def index
    @rooms = Room.all
    @rooms = @q.result(distinct: true)
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
      render "rooms/new"
    end
  end  

  def edit
  end

  def own
    @rooms = Room.all
  end
end

private
def set_q
  @q = Room.ransack(params[:q])
end
