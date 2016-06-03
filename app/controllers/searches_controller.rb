class SearchesController < ApplicationController
	before_filter :require_user
  	def new
		@search = Search.new
		@degrees = ("BT, MT, MCA, MBA, MSW, PHD, MSC").split(', ')
		@branches = ("Bio-Tech., Civil Engg., Chemical Engg., Computer Science, Mechanical Engg., Production and Industrial Engg., Electrical Engg., Electronics and Communication Engg., Information Tech., Applied Mechanics, Bio Med. Engg., Communication Sys., Computer Aided Design and Manufacturing, Control and Instrumentation/Power Sys., Control and Instrumentation (Part time), Design(ME), Digital Sys., Environmental Engg., Fluids Engg., Geotechnical Engg., GIS and Remote Sensing, Information Security, Material Sci. and Engg., Micro-electronics and VLSI Design, Power Electronics and ASIC Design (Part time), Power Electronics and ASIC Design, Product Design and Development, Bio-Tech. Dept., Chemistry Dept., Electrical Engg. Dept., Electronics and Communication Dept., Humanities and Social Sci., Management Studies, Mathematics Dept., Mechanical Engg. Dept., Civil Engg. Dept., Computer Sci. and Engg. Dept., Applied Mechanics Dept.").split(', ')
		
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end

	private 
		def search_params
			params.require(:search).permit(:fname, :lname, :email, :degree, :branch, :year_of_passing, :city, :company)
		end
		def require_user
		  unless current_user
	      flash[:alert] = "You need to Login/Signup to enjoy all facilities."
		    redirect_to "/" and return
		  end
		end
end
