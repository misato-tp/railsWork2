class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end
  
  def new
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:id])
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :how_many_people, :total_price))
    @reservation.total_price = @reservation.sum_of_price
  end

  def confirm
  @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :how_many_people, :total_price,:total_price, :user_id, :image, :room_id))
  @room = Room.find(params[:room_id])
  @reservation.total_days = @reservation.sum_of_days
  @reservation.total_price = @reservation.sum_of_price
  @reservation.save
  end

 private

  def sum_of_days
    (start_date.to_date - end_date.to_date).to_i
  end

  def sum_of_price
    (room.price * how_many_people * total_days).to_i
  end

end