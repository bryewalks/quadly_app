# User.create!([
#   {name: "brye", email: "brye@gmail.com", password_digest: "$2a$10$CVLH63hTEFth9ZxucQx4NeNyynI4HdIH2UlBJs2WaXsCwH5vz92vW", admin: true},
#   {name: "danielle", email: "danielle@gmail.com", password_digest: "$2a$10$b7MA2aFLLsOustcuak2BpOLaIU/aHEYF4BfTUTga4TPb0ETvs5YAu", admin: false}
# ])
# Location.create!([
#   {name: "my house", address: "524 W addison st", latitude: 1, longitude: 3, flight_zone_status: "no_flight_zone"},
#   {name: "dekalb", address: "dekalb il", latitude: 4, longitude: 5, flight_zone_status: "no_flight_zone"}
# ])
# Drone.create!([
#   {name: "danis drone", notes: "put on new props", favorite: true, status: "trash", user_id: 2},
#   {name: "Bryes Drone", notes: "fix flight controller", favorite: false, status: "flyable", user_id: 1}
# ])
# UserLocation.create!([
#   {location_id: 1, user_id: 2},
#   {location_id: 2, user_id: 2}
# ])
# LocationReview.create!([
#   {summary: "great place to fly!", warning: "No Warnings", rating: 5, user_location_id: 1}
# ])
# Weather.create!([
#   {good_to_fly: false, wind_speed: 5, temperature: 90, visibility_miles: 2, max_gust_speed: 9, chance_of_precipitation: 3, cloud_cover: 15, wind_direction: "north_east", location_id: 1}
# ])
