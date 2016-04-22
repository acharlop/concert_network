class ConcertsController < ApplicationController
	def index
		@concerts = Concert.order(date: :asc)
	end
end
