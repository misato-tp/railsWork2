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
    @reservation = Reservation.new
  end

  def show
  
  end
end
