class ConcertsController < ApplicationController
	def index
		@concerts = Concert.order(date: :asc)
	end

	def new
		@concert = Concert.new
	end

	def create
		@concert = Concert.new(concert_params)
		if @concert.save
			redirect_to concert_path
		else
			flash[:alert] = "ERROR Creating concert"
			render "new"
		end
	end

	def show
		@concert = Concert.find_by id: params[:id]
		p @concert
		if @concert.nil?
			flash[:alert] = "No concert found with that id"
			redirect_to concerts_path
		end
	end

	def edit
		@concert = Concert.find_by id: params[:id]
	end

	def update
		@concert = Concert.find_by id: params[:id]

		if @concert.update(concert_params)
			redirect_to concert_path
		else
			flash[:alert] = "ERROR Updating concert"
			render "edit"
		end
	end

	def destroy
		Concert.destroy params[:id]
		redirect_to concerts_path
	end

	private

	def concert_params
		params.require(:concert).permit(:artist, :venue, :city, :price, :date, :description)
	end
end


