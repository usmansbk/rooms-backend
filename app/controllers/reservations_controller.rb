class ReservationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_reservation, only: :destroy

  def index
    @reservations = current_user.reservations.includes(:room)
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.fetch(:reservation).permit(:nights, :check_in, :room_id)
  end
end
