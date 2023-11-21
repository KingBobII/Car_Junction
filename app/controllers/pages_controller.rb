class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
  end
end
