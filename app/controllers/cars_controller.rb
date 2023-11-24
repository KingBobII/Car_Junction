class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index]

  def index_all
    @cars_all = Car.all
  end

  def index
    @user_cars = current_user.cars
  end

  # def index_all
  #   @cars = Car.all
  # end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to @car, notice: "Car was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_path, notice: "Car was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def car_params
    params.require(:car).permit(:name, :year, :mileage, :description, :registration_number, :image, :price_per_day)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
