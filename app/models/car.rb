class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :image
  validates_presence_of :name, :year, :mileage, :description, :registration_number, :price_per_day
end
