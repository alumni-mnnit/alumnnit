class ConventionRequestsController < ApplicationController
	before_action :require_user
	before_action :check_user

	def new
		@convention_request = current_user.build_convention_request(params[:id])
		@convention_request.convention = Convention.last
		if @convention_request.save
			@convention_request.convention = Convention.last
			flash[:notice] = "You are successfully registered for this Convention."
			redirect_to conventions_path
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
				elsif current_user.is_active and current_user.year_of_passing.nil?
            		flash[:notice] = "Please update your Year_Of_Passing !!"
            		redirect_to edit_user_registration_path
            	end
            end
        end

        def check_user
        	if (current_user.year_of_passing.year + 25 == Convention.last.year.year) or (current_user.year_of_passing.year + 50 == Convention.last.year.year)
        		return 
        	else
        		flash[:notice] = "Sorry! You cannot register for this Convention."
        		redirect_to conventions_path
        	end
        end
end
