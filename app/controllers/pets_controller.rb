class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pets = policy_scope(Pet) # looks inside pet_policy resolve to find Pet.all, policy_scope is only used in index
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet # authorize is used everywhere but index
    @booking = Booking.new # because we are making a form on the show page, we need a blank booking
    @review = Review.new
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    authorize @pet
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  private

  def pet_params
  params.require(:pet).permit(:name, :character, :description, :price, :species, :photo)

  end


end
