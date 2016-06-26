class PagesController < ApplicationController
  before_filter :require_user , except: [:home, :about, :contact, :chapters, :downloads]
  before_filter :confirm_user, only:[:home, :about, :contact, :fund]
  def home
    @newses = News.order('created_at DESC').page params[:page]
    @jobs = Job.order('created_at DESC').page params[:page]
  end

  def about
  end

  def comming_soon
  end

  def fund
  end

  def activate
  end

  def downloads
  end

  def chapters

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
        elsif user_signed_in? and current_user.is_active == true
          if current_user.fname.nil? or current_user.degree.nil? or current_user.branch.nil? or current_user.year_of_passing.nil?
            flash[:notice] = "Please update your Profile !!"
          end
          
        end
      end
end
