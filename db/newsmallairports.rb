airport_file = File.read("./storage/airports.json")
airports = JSON.parse(airport_file)

airports_array = []

airports.each do |airport|
    # if airport["ident"][0] == "0"
    #     puts airport["ident"]
    # end
  # if !airport["type"]["seaplane_base"] && !airport["type"]["closed"] && !airport["type"]["heliport"] && !airport["type"]["large_airport"] && !airport["type"]["medium_airport"] && airport["iso_country"]["US"] && airport["iso_region"]["US-IL"] && (airport["ident"][0] == 'K')
  #   airports_array << airport
  #   puts airport["ident"] + " ident"
  #   puts airport["iso_region"] + " region"
    # @location = Location.create!(
    #                   name: airport["name"],
    #                   latitude: airport["latitude_deg"],
    #                   longitude: airport["longitude_deg"],
    #                   flight_zone_status: 0,
    #                   airport: 2,
    #                   )
    if airport["type"]["small_airport"] && airport["iso_country"]["US"] && (airport["ident"][0] == 'K')
        # puts airport["name"]
        # airports_array << airport
        @location = Location.create!(
                          name: airport["name"],
                          latitude: airport["latitude_deg"],
                          longitude: airport["longitude_deg"],
                          flight_zone_status: 2,
                          airport: 2,
                          )
    end

  # end
end
# p airports_array.length