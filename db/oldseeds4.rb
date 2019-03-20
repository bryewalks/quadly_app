User.create!([
  {name: "brye", email: "brye@gmail.com", password_digest: "$2a$10$CVLH63hTEFth9ZxucQx4NeNyynI4HdIH2UlBJs2WaXsCwH5vz92vW", admin: true},
  {name: "danielle", email: "danielle@gmail.com", password_digest: "$2a$10$b7MA2aFLLsOustcuak2BpOLaIU/aHEYF4BfTUTga4TPb0ETvs5YAu", admin: false},
  {name: "Mark", email: "mark@gmail.com", password_digest: "$2a$10$osFBina8YlES0yRFm6pLOOKwnl6PiHTDQCFiPDPwvU2xvFUs/dBs.", admin: false}
])
Drone.create!([
  {name: "Betsy five", notes: "Needs new propellers", favorite: false, status: "flyable", user_id: 1},
  {name: "yes", notes: "yes", favorite: true, status: "flyable", user_id: 3},
  {name: "My First Drone", notes: "never", favorite: true, status: "flyable", user_id: 1},
  {name: "Betsy Two", notes: "The Second!", favorite: true, status: "trash", user_id: 1}
])
Location.create!([
  {name: "Bryes House", address: "524 W addison st", latitude: "41.948091", longitude: "-87.644804", flight_zone_status: "no_flight_zone", airport: false},
  {name: "Actualize", address: "215 W Ohio st chicago il", latitude: "41.892137", longitude: "-87.634821", flight_zone_status: "no_flight_zone", airport: false},
  {name: "Shabbona", address: "Shabbona Illinois", latitude: "41.768085", longitude: "-88.877031", flight_zone_status: "flight_zone", airport: false},
  {name: "Praire Park", address: "615 Ellwood Ave, DeKalb, IL 60115", latitude: "41.925823", longitude: "-88.761982", flight_zone_status: "no_flight_zone", airport: false},
  {name: "White House", address: "white house", latitude: "38.8977", longitude: "-77.036553", flight_zone_status: "no_flight_zone", airport: false},
  {name: "Sears Tower", address: "Sears Tower", latitude: "41.878876", longitude: "-87.635928", flight_zone_status: "no_flight_zone", airport: false},
  {name: "Malta", address: "Malta Illinois", latitude: "41.929221", longitude: "-88.862314", flight_zone_status: "flight_zone", airport: false}
])
LocationReview.create!([
  {summary: "great place to fly!", warning: "No Warnings", rating: 5, user_location_id: 1},
  {summary: "bad", warning: "good", rating: 3, user_location_id: 2},
  {summary: "bad", warning: "great", rating: 5, user_location_id: 2},
  {summary: "bad", warning: "great", rating: 5, user_location_id: 2},
  {summary: "good", warning: "good", rating: nil, user_location_id: 2}
])
UserLocation.create!([
  {location_id: 1, user_id: 1, status: "to_visit"},
  {location_id: 2, user_id: 1, status: "visited"},
  {location_id: 3, user_id: 1, status: "visited"}
])
