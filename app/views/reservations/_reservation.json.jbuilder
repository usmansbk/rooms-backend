json.id reservation.id
json.nights reservation.nights
json.check_in reservation.check_in

json.room do
  json.partial! partial: 'rooms/room', room: reservation.room
end
