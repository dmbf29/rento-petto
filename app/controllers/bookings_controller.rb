class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @bookings = policy_scope(Booking).order(:start_date)
  end

  def new
    @booking = Booking.new
    @pet = Pet.find_by(params[:id])
    authorize @booking
  end

  # POST /restaurants
  def create
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      @review = Review.new
      render 'pets/show'
    end
  end

  # GET /restaurants/1/edit
  def edit
    authorize @restaurant # performed in the set_restaurant
  end

  # PATCH/PUT /restaurants/1
  def update
    # without Pundit:
    # raise 'NotAuthorized' unless current_user == @restaurant.user

    # authorize @restaurant # performed in the set_restaurant
    if @booking.update(booking_params)
      redirect_to owner_bookings_path, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /restaurants/1
  # def destroy
    # without Pundit:
    # raise 'NotAuthorized' unless current_user == @restaurant.user
  #   @booking.destroy
  #   redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:pet_id, :user_id, :start_date, :return_date, :status)
  end
end
