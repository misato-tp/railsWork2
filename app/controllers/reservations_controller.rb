class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    
    if @reservation.save
      redirect_to reservations_confirm_path(@room,@reservation)
    end
  end

  def confirm
    @reservation.total_days = ((@reservation.end_date) - (@reservation.start_date)).to_i
    @reservation.total_price =((@room.price) * (@reservation.how_many_people) * (@reservation.total_days)).to_i
  end

 private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :how_many_people, :total_price, :room_id, :image, :price, :user_id)
  end


end