class Weather < ApplicationRecord
  belongs_to :location
  enum wind_direction: {north: 0, north_east: 1, east: 2, south_east: 3, south: 4, south_west: 5, west: 6, north_west: 7}

  # def initialize(input_options)
  #   super

  # end

  def check_wind_speed
    self.wind_speed < 20
  end

  def check_temperature
    self.temperature.between?(32,98)
  end

  def check_visibility
    self.visibility > 3
  end

  def check_gust
    self.max_gust_speed < 20
  end

  def check_precipitation
    self.chance_of_precipitation < 40
  end

  def check_clouds
    self.cloud_cover < 75
  end

  def check_weather
    true if check_wind_speed && check_temperature && check_visibility && check_gust && check_precipitation && check_clouds
  end
end
