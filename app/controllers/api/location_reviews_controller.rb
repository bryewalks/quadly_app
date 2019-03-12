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
                                          location_id: params[:location_id],
                                          user_id: current_user.id
                                          )
    if @location_review.save
      render 'show.json.jbuilder'
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
    if location_review.user_id == current_user.id
      @location_review.rating = params[:rating] || @location_review.rating
      @location_review.summary = params[:summary] || @location_review.summary
      @location_review.warning = params[:warning] || @location_review.warning
      @location_review.status = params[:location_id] || @location_review.location_id

      if @location_review.save
        render 'show.json.jbuilder'
      else
        render json: {errors: @location_review.errors.full_messages},status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
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
