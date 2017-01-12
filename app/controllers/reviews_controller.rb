class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = @restaurant.reviews.build_with_user(review_params,current_user)

    if @review.save
      redirect_to '/restaurants'
    else
      if @review.errors[:user]
        flash[:notice] = 'You have already reviewed this restaurant'
        redirect_to '/restaurants'
      else
        render :new
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to "/restaurants/#{params[:restaurant_id]}"
  end





  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end





end
