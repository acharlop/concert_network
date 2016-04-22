class CommentsController < ApplicationController
	
	def create
		@concert = Concert.find params[:concert_id]
		@comment = @concert.comments.new(comment_params)
		if @comment.save
			flash[:message] = "Comment added successfully"
			redirect_to concert_path(@concert)
		else
			@comments = @concert.comments.order(created_at: :asc)
			flash[:alert] = "ERROR: Adding comment"
			render :template => "shared/show"
		end	
	end

	private
	def comment_params
		params.require(:comment).permit(:name, :comment)
	end
end
