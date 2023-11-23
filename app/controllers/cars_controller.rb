class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @cars = Car.all
  end

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
  end

  private

  def car_params
    params.require(:car).permit(:name, :year, :mileage, :description, :registration_number, :image, :price_per_day)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
