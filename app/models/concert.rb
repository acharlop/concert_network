class Concert < ActiveRecord::Base
	has_many :comments
	validates_presence_of :artist, :venue, :city, :price, :date, :description
	validates_numericality_of :price, greater_than: 0
	validate :future_date

	scope :today,    ->{where(:date => date_range )}
	scope :tomorrow, ->{where(:date => date_range(1.day.from_now, 1.day.from_now))}
	scope :in_week,  ->{where(:date => date_range(7.days.from_now))}
	scope :in_month, ->{where(:date => date_range(1.month.from_now))}
	scope :in_year,  ->{where(:date => date_range(1.year.from_now))}
	scope :search,   ->(s,f){where(:date => date_range(s,f))}

	scope :asc, ->{order(date: :asc)}
	scope :desc, ->{order(date: :desc)}

	private

	def self.date_range(*date)
		end_d = (date[0] ? date[0] : Time.now).end_of_day
		start = (date[1] ? date[1] : Time.now).midnight
		return start..end_d
	end

	def future_date
		errors.add(:date, "must be in the future") if !date.present? || date < Time.now
	end
end
