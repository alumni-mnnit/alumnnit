class FeedbacksController < ApplicationController
	before_filter :require_user
	def new
	  	@feedback = current_user.feedbacks.build
	end

	def create
	  	@feedback = current_user.feedbacks.build(feedback_params)
	  	if @feedback.save
	  		flash[:notice] = "Feedback is Sent!!"
	  		redirect_to root_path
	  	else
	  		render 'new'
	  	end
	end

	def destroy
		@feedback.destroy
		redirect_to root_path
	end
	private
	  	def feedback_params
	  		params.require(:feedback).permit(:name, :email, :feedback)
	  	end

	  	def require_user
	  	  unless current_user
	        flash[:alert] = "You need to Login/Signup to enjoy all facilities."
	  	    redirect_to "/" and return
	  	  end
	  	end
end
