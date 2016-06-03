class IdCardController < ApplicationController
  def index
  end

  def register
    redirect_to root_path, notice: "Successfully registered for ID Card"
  end
end
