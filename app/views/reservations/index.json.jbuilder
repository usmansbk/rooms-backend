json.array! @reservations do |reservation|
  json.id reservation.id
  json.nights reservation.nights
  json.check_in reservation.check_in

  json.room do
    json.id reservation.room.id
    json.city reservation.room.city
  end
end
