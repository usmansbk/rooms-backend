class ReservationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_reservation, only: :destroy

  # GET /reservations
  def index
    @reservations = Reservation.all

    render json: @reservations
  end

  # POST /reservations
  def create
    @reservation = current_user.reservations.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.fetch(:reservation).permit(:nights, :check_in, :room_id)
  end
end
