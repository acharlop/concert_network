class TicketsController < ApplicationController
	def create
		p "+"*50
		concert = Concert.find params[:concert_id]
		concert.increment(:tickets, by = 1)
		concert.save
		flash[:message] = "Tickets purchased!"
		redirect_to concert_path(concert)
	end
end
