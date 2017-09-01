class Subject < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
  has_many :attendances, dependent: :destroy
  validates :location, :longitude, :radius, presence: true
  # serialize :recurring, Hash
  
  # def recurring=(value)
  #   if RecurringSelect.is_valid_rule?(value)
  #     super(RecurringSelect.dirty_hash_to_rule(value).to_hash)
  #   else
  #     super(nil)
  #   end
  # end
  
  # def rule
  #   IceCube::Rule.from_hash recurring
  # end

  # def schedule(start)
  #   schedule = IceCube::Schedule.new(start)
  #   schedule.add_recurrence_rule(rule)

  #   schedule    
  # end

  # def calendar_subjects(start)
  #   if recurring.empty?
  #     [self]
  #   else
  #     # start_date = start.beginning_of_month.beginning_of_week
  #     end_date = start.end_of_month.end_of_week
  #     schedule(start_time).occurrences(end_date).map do |date|
  #       Subject.new(id:id, name:name, start_time:date, longitude:longitude, latitude:latitude, radius:radius)
  #     end
  #   end
  # end
end
