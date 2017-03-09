class NoticesController < ApplicationController
	
	before_action :find_notice, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@notices=Notice.all.order("created_at DESC")
	end

	def show

	end

	def new
		@notice = current_user.notices.build
	end

	def create
		@notice = current_user.notices.build(notice_params)
		if @notice.save
			redirect_to root_path
		else
			render 'new'
		end
	end
	
	def edit
	end

	def update
		if @notice.update(notice_params)
			redirect_to notice_path
		else
			render 'edit'
		end
	end

	def destroy
		@notice.destroy
		redirect_to root_path
	end



	private

	def notice_params
		params.require(:notice).permit(:title, :description)
	end
	 def find_notice
	 	@notice = Notice.find(params[:id])
	 end

end
