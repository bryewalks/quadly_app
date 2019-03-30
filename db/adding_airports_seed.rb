airport_file = File.read("./storage/airports.json")
airports = JSON.parse(airport_file)

# airports_array = []

airports.each do |airport|
    if airport["type"]["large_airport"] || airport["type"]["medium_airport"] && !(airport["iso_country"]["US"])
        # puts airport["name"]
        # airports_array << airport
        @location = Location.create!(
                          name: airport["name"],
                          latitude: airport["latitude_deg"],
                          longitude: airport["longitude_deg"],
                          flight_zone_status: 0,
                          airport: 1,
                          address: "#{airport["municipality"]} #{airport["iso_country"]}"
                          )
    end

  # end
end
# p airports_array.length
# locations = Location.all

# locations.each do |location|
#   if location.address && location.address.include?("+")
#     location.destroy
#   end
# end