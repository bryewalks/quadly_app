class Api::DronesController < ApplicationController

  def index
    @drones = Drone.all
    render 'index.json.jbuilder'
  end

  def create
    @drone = Drone.new(
                      name: params[:name]
                      notes: params[:notes],
                      favorite: params[:favorite],
                      status: params[:status],
                      users_id: current_user.id
                      )
    if @drone.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @drone.errors.full_messages},status: :unprocessable_entity
    end
  end

  def show
    @drone = Drone.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @drone = Drone.find(params[:id])

    @drone.name = params[:name] || @drone.name
    @drone.notes = params[:notes] || @drone.notes
    @drone.favorite = params[:favorite] || @drone.favorite
    @drone.status = params[:status] || @drone.status

    if @drone.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @drone.errors.full_messages},status: :unprocessable_entity
    end
  end

  def destroy
    drone = Drone.find(params[:id])
    drone.destroy
    render json: {message: "Successfully Removed Drone"}
  end
end
