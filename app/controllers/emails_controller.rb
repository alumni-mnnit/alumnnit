class EmailsController < ApplicationController
  before_filter :check_user
  def new
  	@email = Email.new
  end

  def create
  	@email = Email.new(email_params)
  	if @email.save
      #send email to users
      send_em(@email)
  		flash[:notice] = "Email is Sent!!"
  		redirect_to root_path
    else  
  		render 'new'
  	end
  end
  private
  	def email_params
  		params.require(:email).permit(:batch, :subject, :message)
  	end

    def check_user
      if current_user.is_admin == false
        flash[:notice] = "Sorry! You must be Admin to perform the task."
        redirect_to root_path
      end
    end

    def send_em(email)
      @email = email
      @batch = @email.batch
      
      @users = User.all
      if !@batch.nil?
        @users = @users.where(["year_of_passing LIKE ?","%#{@batch}%"]) if @batch.present?
      end
      @users.each do |user|
        UserMailer.send_email(user, user.email,@email.subject, @email.message).deliver! 
      end
    end
    
end
