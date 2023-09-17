class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.save
    redirect_to reservation_path
  end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :how_many_people,:total_days))
  
    @reservation.save
  end

  def show
  
  end
end
