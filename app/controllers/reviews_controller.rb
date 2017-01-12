class ReviewsController < ApplicationController

  before_action :authenticate_user!

  before_action :require_permission, :only => [:destroy]

  def require_permission
    if current_user != Review.find(params[:id]).user
      flash[:notice] = 'You can only delete reviews you have created'
      redirect_to "/restaurants/#{params[:restaurant_id]}"
    end
  end

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
