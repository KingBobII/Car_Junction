class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @current_user_bookings = current_user.bookings
    @user_car_bookings = Booking.joins(:car).where(cars: { user_id: current_user.id })
    # current_user.cars.each do |car|
    #   @user_car_bookings << car.bookings
    # end
    # @user_car_bookings = @user_car_bookings.flatten
    puts "DEBUG: @user_car_bookings=#{@user_car_bookings.inspect}"
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
    @booking = Booking.find(params[:id])
    if @booking.update!(status: 1)
      redirect_to bookings_path, notice: 'Booking accepted'
    else
      redirect_to bookings_path, notice: 'Booking could not be accepted - please try again'
    end
  end

  def reject
    @booking = Booking.find(params[:id])
    if @booking.update!(status: 2)
      redirect_to bookings_path, notice: 'Booking rejected'
    else
      redirect_to bookings_path, notice: 'Booking could not be rejected - please try again'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :car_id)
  end
end
