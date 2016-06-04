class IdCardController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def register
    if current_user.year_of_passing.nil? or current_user.degree.nil? or current_user.branch.nil?
      redirect_to idcard_path, notice: "Please fill in your year of passing, degree and branch first!"
    else
      current_user.id_card_request = IdCardRequest.new status: false
      redirect_to root_path, notice: "Successfully registered for ID Card"
    end
  end
end
