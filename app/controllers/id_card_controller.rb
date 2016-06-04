class IdCardController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def register
    current_user.id_card_request = IdCardRequest.new status: false
    redirect_to root_path, notice: "Successfully registered for ID Card"
  end
end
