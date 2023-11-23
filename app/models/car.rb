class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :image
  validates_presence_of :name, :year, :mileage, :review, :registration_number
end
