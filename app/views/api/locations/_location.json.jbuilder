json.id location.id
json.name location.name
json.address location.address
json.flight_zone_status location.flight_zone_status

json.position do
  json.lat location.latitude
  json.lng location.longitude
end

json.location_reviews do
  json.array! location.location_reviews, partial: 'api/location_reviews/location_review', as: :location_review
end