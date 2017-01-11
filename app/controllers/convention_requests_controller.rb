class ConventionRequestsController < ApplicationController
	before_action :require_user
	before_action :check_user
	before_action :find_convention_request, only: [:edit, :update, :create_payment_sj, :create_payment_ot]

	#before_filter :request_check
	
	def new
		@convention_request = current_user.build_convention_request
	end

	def create
		@convention_request = current_user.build_convention_request(convention_params)
		@convention_request.convention = Convention.last
		@convention_request.user = current_user
		if @convention_request.save
			#flash[:notice] = "Thank you for registration."
			if current_user.year_of_passing.year == @convention_request.convention.year.year - 25
				redirect_to create_payment_sj_path
			else
				redirect_to create_payment_ot_path
			end
		else
			render 'new'
		end
	end

	def edit

	end
	
	def update
		if @convention_request.update(convention_params)
			flash[:notice] = "Changes Updated"
			 if current_user.year_of_passing.year == @convention_request.convention.year.year - 25
                                redirect_to create_payment_sj_path
                        else
                                redirect_to create_payment_ot_path
                        end
		else
			render 'edit'
		end
	end
	
	def create_payment_sj
		email = current_user.email
		#@convention_request = current_user.convention_request
		@pay_amount = @convention_request.pay_amount
		if @convention_request.address.include?("India") or @convention_request.address.include?("india")
			#@tax_amount = (@pay_amount*1.9)/100 + 3
			#@tax_amount = @tax_amount*1.15
			#@tax_amount = @tax_amount.ceil
			@total_amount = (@pay_amount*1.02234).ceil
			@tax_amount = @total_amount - @pay_amount
		else
			
			@total_amount = (@pay_amount*1.036).ceil
			@tax_amount = @total_amount-@pay_amount
			#var = 1.02234
			#@total_amount = ((@pay_amount+3.45)*var).to_f
			#@tax_amount = (@total_amount-@pay_amount).to_f
			#@tax_amount = (@pay_amount*3)/100 + 3
			#@tax_amount = @tax_amount*1.15
			#@tax_amount = @tax_amount.ceil
		end	
		#@total_amount = @pay_amount + @tax_amount
		@payment_id = params[:payment_id]
		if @payment_id.nil?
			if @convention_request.pay_amount >= 5000
				@payment = INSTA_CLIENT.payment_request({amount: @total_amount, purpose: 'Convention Registration', currency: 'INR', send_email: true, email: "#{email}", redirect_url: "http://alumni.mnnit.ac.in/create_payment_sj"})
				redirect_to @payment.longurl
			else
				flash[:notice] = "Minimum Registration Fees allowed is Rs.5000"
				render 'edit'
			end
		else
			@convention_request.update payment: @payment_id.to_s
			@response = INSTA_CLIENT.payment_detail(@convention_request.payment).to_h
			if @response["status"] == "Credit" and @response["buyer_email"] == current_user.email
				flash[:notice] = "Thank you for the payment."
			else
				flash[:notice] = "Your registration request for the Convention-#{@convention_request.convention.year.year} is received. It is being processed."
			end
		end	
			
	end

	def create_payment_ot
		email = current_user.email
		#@convention_request = current_user.convention_request
		@pay_amount = @convention_request.pay_amount
		if @convention_request.address.include?("India") or @convention_request.address.include?("india")
			@total_amount = (@pay_amount*1.02234).ceil
			@tax_amount = @total_amount-@pay_amount
		else
			@total_amount = (@pay_amount*1.036).ceil
			@tax_amount = @total_amount-@pay_amount
		end	
		#@total_amount = @pay_amount + @tax_amount
		@payment_id = params[:payment_id]
		if @payment_id.nil?
			if @convention_request.pay_amount >= 1500
				@payment = INSTA_CLIENT.payment_request({amount: @total_amount, purpose: 'Convention Registration', currency: 'INR', send_email: true, email: "#{email}", redirect_url: "http://alumni.mnnit.ac.in/create_payment_ot"})
				redirect_to @payment.longurl
			else
				flash[:notice] = "Minimum Registration Fees allowed is Rs.1500"
				render 'edit'
			end	
		else
			@convention_request.update payment: @payment_id.to_s
			@response = INSTA_CLIENT.payment_detail(@convention_request.payment).to_h
			if @response["status"] == "Credit" and @response["buyer_email"] == current_user.email
				flash[:notice] = "Thank you for the payment."
			else
				flash[:notice] = "Your registration request for the Convention-#{@convention_request.convention.year.year} is received. It is being processed."
			end
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

        def request_check
        	if current_user and !current_user.convention_request.nil?
        		if current_user.convention_request.convention == Convention.last
        			flash[:notice] = "You have already requested for the registration."
        			redirect_to convention_path(Convention.last.id)
        		end
        	end
        end

        def convention_params
        	params.require(:convention_request).permit(:name,:degree, :branch, :year_of_passing, :designation, :address, :is_attending, :accompanions, :pay_amount)
        end

        def find_convention_request
        	@convention_request = current_user.convention_request
        end
end
