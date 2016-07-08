class IdCardController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_filter :require_user

  def index
  end

  def register
    if current_user.year_of_passing.nil? or current_user.degree.nil? or current_user.branch.nil?
      redirect_to idcard_path, notice: "Please fill in your year of passing, degree and branch first!"
    else
      current_user.id_card_request = IdCardRequest.new status: false
      redirect_to idcard_payment_path, notice: "Successfully registered for ID Card"
    end
  end

  def id_payment
  end

  private 
    def require_user
      if !user_signed_in?
        flash[:notice] = "You need to Login/Signup to use all the facilities!"
        redirect_to root_path
      else
        if current_user.is_active == false and current_user.request.nil? 
          flash[:notice] = "Please! request for Account Activation."
          redirect_to root_path
        elsif current_user.is_active == false and !current_user.request.nil?
          flash[:notice] = "Your Account is not activated yet!"
          redirect_to root_path
        end
      end
    end

end
