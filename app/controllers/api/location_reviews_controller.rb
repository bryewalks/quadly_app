class Api::LocationReviewsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @location_reviews = LocationReview.all
    render 'index.json.jbuilder'
  end

  def create
    @location_review = LocationReview.new(
                                          rating: params[:rating],
                                          summary: params[:summary],
                                          warning: params[:warning],
                                          user_location_id: params[:user_location_id],
                                          )
    if @location_review.user_location.status == "visited" && @location_review.save
      render 'show.json.jbuilder'
    elsif @location_review.user_location.status != "visited" 
      render json: {message: "Location Must Be Marked As Visited"},status: :unauthorized
    else
      render json: {errors: @location_review.errors.full_messages},status: :unprocessable_entity
    end
  end

  def show
    @location_review = LocationReview.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @location_review = LocationReview.find(params[:id])

    @location_review.rating = params[:rating] || @location_review.rating
    @location_review.summary = params[:summary] || @location_review.summary
    @location_review.warning = params[:warning] || @location_review.warning

    if @location_review.user.id == current_user.id && @location_review.save
      render 'show.json.jbuilder'
    elsif @location_review.user.id != current_user.id
      render json: {}, status: :unauthorized
    else
      render json: {errors: @location_review.errors.full_messages},status: :unprocessable_entity
    end
  end

  def destroy
    location_review = LocationReview.find(params[:id])
    if location_review.user_id == current_user.id
      location_review.destroy
      render json: {message: "Successfully Removed Location Review"}
    else
      render json: {}, status: :unauthorized
    end
  end
end
