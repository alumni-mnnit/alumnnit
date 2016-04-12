class PagesController < ApplicationController
  before_filter :require_user , except: [:home, :about, :contact]
  def home
  end

  def about
  end

  def contact
  end

  protected
	def require_user
	  unless current_user
	    redirect_to "/" and return
	  end
	end
end
