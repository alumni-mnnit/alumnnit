class PagesController < ApplicationController
  before_filter :require_user , except: [:home, :about]
  def home
  end

  def about
  end

  def contact
  end

  protected
	def require_user
	  unless current_user
      flash[:alert] = "You need to Login/Signup to enjoy all facilities."
	    redirect_to "/" and return
	  end
	end
end
