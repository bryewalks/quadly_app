class Api::WeathersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def create
    search_lat = params[:search_lat]
    search_lng = params[:search_lng]
    response = HTTP.get("https://api.darksky.net/forecast/#{ ENV['API_KEY'] }/#{ search_lat },#{ search_lng }")
    response = response.parse['currently']
    @weather = Weather.new(
                          wind_speed: response['windSpeed'],
                          temperature: response['temperature'],
                          visibility_miles: response['visibility'],
                          max_gust_speed: response['windGust'],
                          chance_of_precipitation: response['precipProbability'],
                          cloud_cover: response['cloudCover'],
                          location_id: params[:location_id]
                          )
      render 'show.json.jbuilder'
  end

  def show
    @weather = Weather.find(params[:id])
    render 'show.json.jbuilder'
  end

  def destroy
    weather = Weather.find(params[:id])
    weather.destroy
    render json: {message: "Successfully Removed Weather"}
  end
end