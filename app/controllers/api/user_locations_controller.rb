class Api::UserLocationsController < ApplicationController
  before_action :authenticate_user

  def index
    @user_locations = UserLocation.where(user_id: current_user.id)
    render 'index.json.jbuilder'
  end

  def create    
    @user_location = UserLocation.new(
                                      user_id: current_user.id,
                                      location_id: params[:location_id],
                                      status: params[:status]
                                      )

    @user_location.save
    render 'show.json.jbuilder'
        
  end

  def update
    @user_location = UserLocation.find(params[:id])

    @user_location.location_id = params[:location_id] || @user_location.location_id
    @user_location.status = params[:status] || @user_location.status

    if @user_location.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user_location.errors.full_messages},status: :unprocessable_entity
    end
  end

  def destroy
    user_location = UserLocation.find(params[:id])
    user_location.destroy
    render json: {message: "Successfully removed user location"}
  end
end
