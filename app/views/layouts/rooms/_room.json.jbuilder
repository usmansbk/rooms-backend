json.id room.id
json.name room.name
json.city room.city
json.bed_type room.bed_type
json.facilities room.facilities
json.size room.size
json.price room.price
json.created_at room.created_at
json.picture url_for(room.picture)

json.user do
  json.id room.user.id
  json.name room.user.name
end