class Concert < ActiveRecord::Base
	validates_presence_of :artist, :venue, :city, :price, :date, :description
	validates_numericality_of :price, greater_than: 0
	validate :future_date

	private

	def future_date
		errors.add(:date, "must be in the future") if !date.present? || date < Time.now
	end
end
