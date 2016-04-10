class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
  	devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(:fname,:lname,:nick_name,:gender,:reg_no,:phn_no,:date_of_birth,:degree,:branch,:year_of_passing,:curr_address,:pincode,:h_town,:city,:country,:company,:designation,:achievements, :current_password)
  	}	
  end
end
