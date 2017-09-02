class Subject < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
  has_many :attendances, dependent: :destroy
  # validates :location, :longitude, :radius, presence: true

end
