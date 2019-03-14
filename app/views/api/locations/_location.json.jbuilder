json.id location.id
json.name location.name
json.address location.address
json.latitude location.latitude
json.longitude location.longitude
json.flight_zone_status location.flight_zone_status

json.location_reviews do
  json.array! location.location_reviews, partial: 'api/location_reviews/location_review', as: :location_review
end