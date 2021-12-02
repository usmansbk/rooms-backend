class RoomsController < ApplicationController
  load_and_authorize_resource
  before_action :set_room, only: %i[show destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @rooms = Room.includes(:user).all
  end

  def show; end

  def create
    @room = current_user.rooms.new(room_params)

    if @room.save
      render json: @room, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.fetch(:room).permit(:name, :city, :price, :size, :bed_type, :facilities, :picture)
  end
end
