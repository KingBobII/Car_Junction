class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    @current_user_bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
    @car = @booking.car
    @owner = @booking.car.user
    @booker = @booking.user
  end

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path, notice: 'Booking successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_path, notice: "Booking was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def accept
    if @booking.update!(status: 1)
      redirect_to display_bookings_path, notice: 'Booking accepted'
    else
      redirect_to display_bookings_path, notice: 'Booking could not be accepted - please try again'
    end
  end

  def reject
    if @booking.update!(status: 2)
      redirect_to display_bookings_path, notice: 'Booking rejected'
    else
      redirect_to display_bookings_path, notice: 'Booking could not be rejected - please try again'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :car_id)
  end
end
