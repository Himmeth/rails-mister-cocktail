class ReviewsController < ApplicationController
  def new
    @cocktail = Cocktail.all.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @cocktail = Cocktail.all.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail_id = params[:cocktail_id]
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :cocktail_id)
  end
end
