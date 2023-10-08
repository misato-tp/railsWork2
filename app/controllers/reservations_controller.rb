class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end
  
  def new
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :how_many_people, :total_price, :room_id))
    
    if @reservation.save
      redirect_to confirm_reservations_path(@room,@reservation)
    else
      render :show
    end
  end

  def confirm
  @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :how_many_people, :total_days, :total_price, :user_id, :image, :room_id, :price))
  @room = Room.new(params[:room_id])
  @reservation.total_days = ((@reservation.end_date.to_date)-(@reservation.start_date.to_date)).to_i
  @reservation.total_price = (@reservation.price)*(@reservation.how_many_people)*(@reservation.total_days).to_i
  @reservation.save
  redirect_to reservations_path
  end

 private

end