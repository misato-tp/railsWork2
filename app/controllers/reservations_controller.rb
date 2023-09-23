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
    @reservation = Reservation.new(reservation_params)
    render :confirm
  end
end

def reservation_params
    params.permit(
      :start_date,
      :end_date,
      :how_many_people
    )
end