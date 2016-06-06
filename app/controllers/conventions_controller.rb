class ConventionsController < ApplicationController
	before_filter :require_user, except: [:index]
	def index
		@conventions = Convention.all
		@convention = Convention.last
	end

	def new
		@convention = Convention.new
	end

	def create
		@convention = Convention.new(convention_params)
		if @convention.save
			flash[:notice] = "Convention Created Successfully!"
			render 'index'
		else
			render 'new'
		end
	end

	#def destroy

	#end

	private
		def require_user
			if !user_signed_in? and current_user.is_admin == false
				flash[:notice] = "You must be Admin to perform the task."
				redirect_to root_path
			end
		end

		def convention_params
			params.require(:convention).permit(:year, :start_date)
		end

end
