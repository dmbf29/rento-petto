class BookingsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

# GET /restaurants
def index
  @bookings = policy_scope(Booking).order( )
end

# GET /restaurants/1
def show
  # authorize @restaurant # performed in the set_restaurant
end

# GET /restaurants/new
def new
  @booking = Booking.new
  authorize @booking
end

# GET /restaurants/1/edit
def edit
  # authorize @restaurant # performed in the set_restaurant
end

# POST /restaurants
def create
  @booking = Booking.new(booking_params)
  @booking.user = current_user

  authorize @booking
  if @booking.save
    redirect_to @booking, notice: 'Booking was successfully created.'
  else
    render :new
  end
end

# PATCH/PUT /restaurants/1
def update
  # without Pundit:
  # raise 'NotAuthorized' unless current_user == @restaurant.user

  # authorize @restaurant # performed in the set_restaurant
  if @booking.update(booking_params)
    redirect_to @booking, notice: 'Booking was successfully updated.'
  else
    render :edit
  end
end

# DELETE /restaurants/1
def destroy
  # without Pundit:
  # raise 'NotAuthorized' unless current_user == @restaurant.user

  @booking.destroy
  redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Bookig.find(params[:id])
    authorize @booking
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:pet_id, :user_id)
  end
end
