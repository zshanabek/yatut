class Subject < ApplicationRecord
  before_validation :time_has_a_date
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
  has_many :attendances, dependent: :destroy
  # validates :latitude, :longitude, :radius, presence: true

  private
	  def time_has_a_date
	    self.start_time = self.start_time.change(year: self.date.year, day: self.date.day, month: self.date.month)
	    self.end_time = DateTime.parse('1998-02-03T04:05:06+07:00')
	    self.created_at = DateTime.parse('1988-02-03T04:05:06+07:00')
	  end
end
