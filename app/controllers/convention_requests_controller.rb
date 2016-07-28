class ConventionRequestsController < ApplicationController
	before_action :require_user
	before_action :check_user

	def new
		@convention_request = current_user.build_convention_request
	end

	def create
		@convention_request = current_user.build_convention_request(convention_params)
		@convention_request.convention = Convention.last
		if @convention_request.save
			@convention_request.convention = Convention.last
			flash[:notice] = "You are successfully registered for this Convention."
			redirect_to conventions_payment_path
		else
			render 'new'
		end
	end

	private
		def require_user
			if !user_signed_in? 
				flash[:notice] = "You must Login/Signup to use all the facilities!"
				redirect_to root_path
			else
				if current_user.is_active == false
					flash[:notice] = "Your account is not activated yet."
					redirect_to root_path
            	end
            end
        end

        def check_user
        	if (current_user.year_of_passing.year <= Convention.last.year.year - 1) and ((current_user.role == 'alumni') or (current_user.role == 'teacher'))
        		return 
        	else
        		flash[:notice] = "Sorry! You cannot register for this Convention."
        		redirect_to conventions_path
        	end
        end

        def convention_params
        	params.require(:convention_request).permit(:name,:degree, :branch, :year_of_passing, :designation, :address, :is_attending, :payment, :accompanions)
        end
end
