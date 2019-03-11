class Api::WeathersController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @weathers = weather.all
    render 'index.json.jbuilder'
  end

  def create
    @weather = Weather.new(

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
