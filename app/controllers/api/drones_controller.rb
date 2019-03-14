class Api::DronesController < ApplicationController
  before_action :authenticate_user

  def index
    @drones = current_user.drones
    render 'index.json.jbuilder'
  end

  def create
    @drone = Drone.new(
                      name: params[:name],
                      notes: params[:notes],
                      favorite: params[:favorite],
                      status: params[:status],
                      user_id: current_user.id
                      )
    if @drone.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @drone.errors.full_messages},status: :unprocessable_entity
    end
  end

  def show
    @drone = Drone.find(params[:id])
    if @drone.user_id == current_user.id
      render 'show.json.jbuilder'
    else
      render json: {}, status: :unauthorized
    end
  end

  def update
    @drone = Drone.find(params[:id])
    
      @drone.name = params[:name] || @drone.name
      @drone.notes = params[:notes] || @drone.notes
      @drone.favorite = params[:favorite] || @drone.favorite
      @drone.status = params[:status] || @drone.status

    if @drone.user_id == current_user.id && @drone.save
      render 'show.json.jbuilder'
    elsif @drone.user_id != current_user.id
      render json: {}, status: :unauthorized
    else
      render json: {errors: @drone.errors.full_messages},status: :unprocessable_entity
    end
  end

  def destroy
    drone = Drone.find(params[:id])

    if drone.user_id == current_user.id
      drone.destroy
      render json: {message: "Successfully Removed Drone"}
    else
      render json: {}, status: :unauthorized
    end
  end
end
