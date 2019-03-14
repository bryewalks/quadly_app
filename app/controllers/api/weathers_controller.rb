class Api::WeathersController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @weathers = Weather.all
    render 'index.json.jbuilder'
  end

  def create
    @weather = Weather.new(
                          # good_to_fly: params[:good_to_fly],
                          wind_speed: params[:wind_speed],
                          temperature: params[:temperature],
                          visibility_miles: params[:visibility_miles],
                          max_gust_speed: params[:max_gust_speed],
                          chance_of_precipitation: params[:chance_of_precipitation],
                          cloud_cover: params[:cloud_cover],
                          wind_direction: params[:wind_direction],
                          location_id: params[:location_id]
                          )
    if @weather.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @weather.errors.full_messages},status: :unprocessable_entity
    end
  end

  def show
    @weather = Weather.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @weather = Weather.find(params[:id])

    @weather.location_id = params[:location_id] || @weather.location_id
    @weather.good_to_fly = params[:good_to_fly] || @weather.good_to_fly
    @weather.wind_speed = params[:wind_speed] || @weather.wind_speed
    @weather.temperature = params[:temperature] || @weather.temperature
    @weather.visibility_miles = params[:visibility_miles] || @weather.visibility_miles
    @weather.max_gust_speed = params[:max_gust_speed] || @weather.max_gust_speed
    @weather.chance_of_precipitation = params[:chance_of_precipitation] || @weather.chance_of_precipitation
    @weather.cloud_cover = params[:cloud_cover] || @weather.cloud_cover
    @weather.wind_direction = params[:wind_direction] || @weather.wind_direction

    if @weather.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @weather.errors.full_messages},status: :unprocessable_entity
    end
  end

  def destroy
    weather = Weather.find(params[:id])
    weather.destroy
    render json: {message: "Successfully Removed Weather"}
  end
end
