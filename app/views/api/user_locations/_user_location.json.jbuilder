json.id user_location.id
json.user_id user_location.user_id
json.location_id user_location.location_id
json.status user_location.status

json.location do
  json.partial! user_location.location, partial: 'api/locations/location', as: :location
end