require 'rest-client'
class RequestsController < ApplicationController
	before_action :find_request, only: [:edit, :update, :destroy]
	before_action :check_user
	before_action :authenticate_user!
	
	def index
		@requests = current_user.request
		if @requests.nil?
			redirect_to root_path
		end
	end

	def show 
	end

	def new
		@request = current_user.build_request
	end

	def create
		@request = current_user.build_request(request_params) if current_user.request.nil?
		if @request.save
			redirect_to root_path, notice: "Request for Account Acticvation has been made successfully."
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @request.update(request_params)
			flash[:notice] = "Request was successfully Updated."
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@request.destroy
		redirect_to root_path
	end

	def academics

	end

	def send_activate
		regno = params[:regno]
		password = params[:password]
		res = RestClient.post "http://172.31.100.19/alumniapi/validateapi.php", { 'regno' => regno, 'password' => password }.to_json, :content_type => :json, :accept => :json
		if res.code == 200
			h = JSON.parse(res.to_s)
			if h["response"] == "true"
				current_user.update(is_active: "true")
				flash[:notice] = "Your account have been activated successfully."
				redirect_to root_path
			else
				flash[:notice] = "Invalid Registration Number or Password."
				redirect_to :back
			end
		else
			flash[:notice] = "Please try again later. There may be a problem with Server."
			redirect_to :back
		end
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
