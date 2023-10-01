class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end
  
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:image, :facility_name, :detail, :total_price, :start_date, :end_date))
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to :reservations
    end
  end

  def confirm
  @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :how_many_people, :total_price))
  @room = Room.find(params[:room_id])
  render :confirm
  @reservation.total_days = @reservation.sum_of_days
  @reservation.total_price = @reservation.sum_of_price
  @reservation.save
  end

 private

  def total_days
    (start_date.to_date - end_date.to_date).to_i
  end

  def total_price
    (room.price * how_many_people * total_days).to_i
  end

end