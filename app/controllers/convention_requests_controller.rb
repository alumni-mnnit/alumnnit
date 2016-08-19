class ConventionRequestsController < ApplicationController
	before_action :require_user
	before_action :check_user
	#api = Instamojo::API.new("65fced5aa4dd50eeaf57f7679c1520a4", "a1c5e4cf827e058ef2a938b6bd41bbd7", "https://test.instamojo.com/api/1.1/")
	#client = api.client
	def new
		@convention_request = current_user.build_convention_request
	end

	def create
		@convention_request = current_user.build_convention_request(convention_params)
		@convention_request.convention = Convention.last
		if @convention_request.save
			#@convention_request.convention = Convention.last
			@response = INSTA_CLIENT.payment_detail(@convention_request.payment).to_h
			if @response["status"] == "Credit" and @response["buyer_email"] == current_user.email
				#@convention_request.update status: true
				flash[:notice] = "Thank You very much! You are successfully registered."
			else
				flash[:notice] = "Your registraion request for the Convention-#{Convention.last.year.year} is received. It is being processed."
			end
			redirect_to convention_path(Convention.last.id)
		else
			render 'new'
		end
	end
	
	#	def create_payment_sj
	#		@response = INSTA_CLIENT.payment_request({amount: 5000.00, purpose: 'Convention Registration', currency: 'INR', send_email: true, email: current_user.email, redirect_url: "#{convention_path(Convention.last.id)}"})
	#		redirect_to @response.longurl
	#	end

	#	def create_payment_ot
	#		@response = INSTA_CLIENT.payment_request({amount: 1500.00, purpose: 'Convention Registration', currency: 'INR',send_email: true, email: current_user.email, redirect_url: "#{convention_path(Convention.last.id)}"})
	#		redirect_to @response.longurl
	#	end
	

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
