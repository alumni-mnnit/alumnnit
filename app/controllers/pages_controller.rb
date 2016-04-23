class PagesController < ApplicationController
  before_filter :require_user , except: [:home, :about]
  before_filter :confirm_user, only:[:home, :about, :contact, :fund]
  def home
  end

  def about
  end

  def contact
  end

  def fund
  end

  protected
	def require_user
	  unless current_user
      flash[:alert] = "You need to Login/Signup to enjoy all facilities."
	    redirect_to "/" and return
	  end
	end

      def confirm_user
        if user_signed_in? and current_user.is_active == false and current_user.request.nil?
            flash[:notice] = "Please request for Account Activation!"
            return 
        end
      end
end
