airport_file = File.read("./storage/airports.json")
airports = JSON.parse(airport_file)

airports_array = []

airports.each do |airport|
  if !airport["type"]["seaplane_base"] && !airport["type"]["closed"] && !airport["type"]["heliport"] && !airport["type"]["large_airport"] && airport["iso_country"]["US"]
    airports_array << airport
    # @location = Location.create!(
    #                   name: airport["name"],
    #                   latitude: airport["latitude_deg"],
    #                   longitude: airport["longitude_deg"],
    #                   flight_zone_status: 0,
    #                   airport: true
    #                   )
  end
end

puts airports_array.length
