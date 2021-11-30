class RoomsController < ApplicationController
  load_and_authorize_resource
  before_action :set_room, only: %i[show destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  # GET /rooms
  def index
    @rooms = Room.all

    render json: @rooms
  end

  def show
    render json: @room
  end

  # POST /rooms
  def create
    @room = current_user.rooms.new(room_params)

    if @room.save
      render json: @room, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def room_params
    params.fetch(:room).permit(:name, :city, :price, :size, :bed_type, :facilities, :picture)
  end
end
