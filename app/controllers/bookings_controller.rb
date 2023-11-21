class BookingsController < ApplicationController
  before_action :set_booking, only: %i[accept reject create destroy]
  def new
    @booking = Booking.new
  end

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to show_cars_path, notice: 'Booking successfully created'
    else
      @bookings = @car.bookings
      render "cars/show", status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
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

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :user_id, :car_id)
  end
end
