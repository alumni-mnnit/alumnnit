class ConventionRequestsController < ApplicationController
	before_action :require_user
	before_action :check_user
	before_filter :request_check
	#api = Instamojo::API.new("65fced5aa4dd50eeaf57f7679c1520a4", "a1c5e4cf827e058ef2a938b6bd41bbd7", "https://test.instamojo.com/api/1.1/")
	#client = api.client
	def new
		@convention_request = current_user.build_convention_request
		session[:payment] = @payment_id = params[:payment_id]
	end

	def create
		#params[:payment] = @payment_id
		@convention_request = current_user.build_convention_request(convention_params)
		@convention_request.convention = Convention.last
		@payment_id = session[:payment]
		if @convention_request.save
			#@convention_request.convention = Convention.last
			@convention_request.update payment: @payment_id.to_s
			@response = INSTA_CLIENT.payment_detail(@convention_request.payment).to_h
			if @response["status"] == "Credit" and @response["buyer_email"] == current_user.email
				#@convention_request.update status: true
				flash[:notice] = "Thank You very much! You are successfully registered."
			else
				flash[:notice] = "Your registration request for the Convention-#{Convention.last.year.year} is received. It is being processed."
			end
			redirect_to convention_path(Convention.last.id)
		else
			render 'new'
		end
	end
	
		def create_payment_sj
			email = current_user.email
			@payment = INSTA_CLIENT.payment_request({amount: 5000.00, purpose: 'Convention Registration', currency: 'INR', send_email: true, email: "#{email}", redirect_url: "http://127.0.0.1:3000/convention_requests/new" })
			redirect_to @payment.longurl
			
		end

		def create_payment_ot
			@response = INSTA_CLIENT.payment_request({amount: 1500.00, purpose: 'Convention Registration', currency: 'INR',send_email: true, email: "#{email}", redirect_url: "http://127.0.0.1:3000/convention_requests/new"})
			redirect_to @response.longurl
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

        def request_check
        	if current_user and !current_user.convention_request.nil?
        		if current_user.convention_request.convention == Convention.last
        			flash[:notice] = "You have already requested for the registration."
        			redirect_to convention_path(Convention.last.id)
        		end
        	end
        end

        def convention_params
        	params.require(:convention_request).permit(:name,:degree, :branch, :year_of_passing, :designation, :address, :is_attending, :accompanions)
        end
end
