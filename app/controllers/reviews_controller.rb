class ReviewsController < ApplicationController
  def create
    @pet = Pet.find(params[:pet_id])
    @review = Review.new(review_params)
    @review.pet = @pet
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to pets_path
    else
      render 'pet/show'
    end

  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
