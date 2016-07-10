class ConventionRequestsController < ApplicationController
	before_action :require_user
	before_action :check_user

	def new
		@convention_request = current_user.build_convention_request(params[:id])
		@convention_request.convention = Convention.last
		if @convention_request.save
			@convention_request.convention = Convention.last
			flash[:notice] = "You are successfully registered for this Convention."
			redirect_to conventions_payment_path
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
				elsif current_user.is_active and (current_user.year_of_passing.nil? or current_user.degree.nil? or current_user.branch.nil? )
            		flash[:notice] = "Please update your Profile (year of passing/ degree/ branch/ current address ) !!"
            		redirect_to edit_user_registration_path
            	end
            end
        end

        def check_user
        	if (current_user.year_of_passing.year <= Convention.last.year.year - 5)
        		return 
        	else
        		flash[:notice] = "Sorry! You cannot register for this Convention."
        		redirect_to conventions_path
        	end
        end
end
