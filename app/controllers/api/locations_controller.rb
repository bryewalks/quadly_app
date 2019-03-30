class Api::LocationsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show, :airport_index, :create]
  before_action :authenticate_admin, only: [:destroy, :update]

  def index
    @locations = Location.where(airport: 0)
    render 'index.json.jbuilder'
  end

  def airport_index
    search_lat = params[:latitude]
    search_lng = params[:longitude]
    search_distance = params[:distance]
    search_address = params[:address]

    if search_lat && search_lng
      @locations = Location.near([search_lat, search_lng], search_distance).where.not(airport: 0)
    elsif search_address
      @locations = Location.near(search_address, search_distance).where.not(airport: 0)
    else
      @locations = Location.where.not(airport: 0)
    end

    render 'index.json.jbuilder'
  end

  def create
    search_lat = params[:search_lat]
    search_lng = params[:search_lng]

    if search_lat && search_lng
      @location = Location.new(
                            latitude: search_lat,
                            longitude: search_lng
                             )
      @location.determine_status
      render 'show.json.jbuilder'
    else
      @location = Location.new(
                        name: params[:name],
                        address: params[:address],
                        latitude: params[:latitude],
                        longitude: params[:longitude]
                        )

      
      if current_user && @location.save
        # @location.determine_status
        @location.save
        render 'show.json.jbuilder'
      else
        render json: {errors: @location.errors.full_messages},status: :unprocessable_entity
      end
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
