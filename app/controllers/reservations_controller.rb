class ReservationsController < ApplicationController
  before_action :set_room, only:[:price, :image]

  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to reservations_path
  end

  def confirm
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to reservations_confirm_path
    else
      @room = Room.find(params[:reservation][:room_id])
      render "rooms/show"
    end
  end

 private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :how_many_people, :total_price, :total_days, :room_id, :image.to_s, :price, :user_id, :facility_name, :detail)
  end

  def set_room
    @room = Room.find(params[:id])
  end

end