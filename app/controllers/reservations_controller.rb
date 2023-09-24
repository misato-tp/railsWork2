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
    @reservation = Reservation.new(reservation_params)
    @room = Room.all
    render :confirm
  end
end

def reservation_params
    params.permit(
      :start_date,
      :end_date,
      :how_many_people,
      :total_days,
      :total_price,
      :image,
      :detail,
      :facility_name
    )
end