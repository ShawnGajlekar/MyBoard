class CommentsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@notice = Notice.find(params[:notice_id])
		@comment = @notice.comments.create(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to notice_path(@notice)
		else
			render 'new'
		end
	end

	def edit
		@notice = Notice.find(params[:notice_id])
		@comment = @notice.comments.find(params[:id])
	end

	def update

		@notice = Notice.find(params[:notice_id])
		@comment = @notice.comments.find(params[:id])
		if @comment.update(comment_params)
			redirect_to notice_path(@notice)
		else 
			render 'edit'
		end
	end

	def destroy
		@notice = Notice.find(params[:notice_id])
		@comment = @notice.comments.find(params[:id])
		@comment.destroy
		redirect_to notice_path(@notice)

	end
	private
	def comment_params
		params.require(:comment).permit(:content, :file)
	end
end
