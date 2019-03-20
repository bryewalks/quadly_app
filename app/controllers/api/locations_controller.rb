class Api::LocationsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show, :airportindex]
  before_action :authenticate_admin, only: [:destroy, :update]

  def index
    airport_option = params[:airport]
    if airport_option
      @airports = Location.where(airport: true)
      render 'index.json.jbuilder'
    end
    @locations = Location.where(airport: false)
    render 'index.json.jbuilder'
  end

  def airportindex
    @locations = Location.where(airport: true)
    render 'index.json.jbuilder'
  end

  def create
    @location = Location.new(
                      name: params[:name],
                      address: params[:address],
                      latitude: params[:latitude],
                      longitude: params[:longitude],
                      flight_zone_status: params[:flight_zone_status]
                      )

    
    if @location.save
      @location.determine_status
      render 'show.json.jbuilder'
    else
      render json: {errors: @location.errors.full_messages},status: :unprocessable_entity
    end
  end

  def show
    @location = Location.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @location = Location.find(params[:id])

    @location.name = params[:name] || @location.name
    @location.address = params[:address] || @location.address
    @location.latitude = params[:latitude] || @location.latitude
    @location.longitude = params[:longitude] || @location.longitude
    @location.flight_zone_status = params[:flight_zone_status] || @location.flight_zone_status

    if @location.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @location.errors.full_messages},status: :unprocessable_entity
    end
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
    render json: {message: "Successfully Removed Location"}
  end
end
