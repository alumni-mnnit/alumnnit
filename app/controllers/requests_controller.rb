class RequestsController < ApplicationController
	before_action :find_request, only: [:show, :edit, :update, :destroy]
	before_action :check_user
	before_action :authenticate_user!
	
	def index
		@requests = current_user.request
	end

	def show 
	end

	def new
		@request = current_user.build_request
	end

	def create
		@request = current_user.build_request(request_params) if current_user.request.nil?
		if @request.save
			redirect_to root_path, notice: "Request for Account Activation has been made successfully."
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @request.update(request_params)
			redirect_to @request, notice: "Request was successfully Updated."
		else
			render 'edit'
		end
	end

	def destroy
		@request.destroy
		redirect_to :back
	end

	private

		def find_request
			@request = Request.find(params[:id])
		end

		def request_params
			params.require(:request).permit(:title, :description, :image)
		end

		def check_user
			if current_user.is_active?
				flash[:notice] = "Your Account is already Active!"
				redirect_to '/' and return
			end

		end

end
