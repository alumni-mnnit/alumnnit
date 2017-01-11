class ConventionsController < ApplicationController
	before_filter :check_user, except: [:index, :show]
	before_filter :require_user, except: [:index, :show, :convention_payment]
	before_action :find_convention, only: [:show]
	
	def index
		@conventions = Convention.all	
	end

	def show
		@registered_users = ConventionRequest.where(status: true).count + 57
		@convention_request = current_user.convention_request if !current_user.nil?
		#@convention_request = @convention_request[0] if !@convention_request.nil?
	end

	def new 
		@convention = Convention.new
	end

	def create
		@convention = Convention.new(convention_params)
		if @convention.save
			flash[:notice] = "Convention Created Successfully!"
			render 'show'
		else
			render 'new'
		end
	end

	#def destroy

	#end
	def convention_payment
	end

	def pdf1
	  pdf_filename = File.join(Rails.root, "assets/pdfs/REGISTRATION FORM (for  Silver Jubilee batch only).pdf")
	  send_file(pdf_filename, :filename => "REGISTRATION FORM (for  Silver Jubilee batch only).pdf", :type => "application/pdf")
	end

	def pdf2
	  pdf_filename = File.join(Rails.root, "assets/pdfs/REGISTRATION FORM (for all batches except Silver Jubilee batch).pdf")
	  send_file(pdf_filename, :filename => "REGISTRATION FORM (for all batches except Silver Jubilee batch).pdfREGISTRATION FORM (for all batches except Silver Jubilee batch).pdf", :type => "application/pdf")
	end
	
	private
		def find_convention
			@convention = Convention.find(params[:id])
		end

		def require_user
			if current_user.is_admin == false
				flash[:notice] = "You must be Admin to perform the task."
				redirect_to root_path
			end
		end

		def check_user
			if !user_signed_in?
				flash[:notice] = "You must Login/Signup to use all the facilities!"
				redirect_to root_path
			elsif current_user.is_active == false
				flash[:notice] = "Please request for Account Activation!"
				redirect_to :back
			end
		end

		def convention_params
			params.require(:convention).permit(:year, :start_date)
		end

end
