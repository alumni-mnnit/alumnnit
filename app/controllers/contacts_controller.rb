class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
  		flash[:notice] = "Query is Sent!!"
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end
  private
  	def contact_params
  		params.require(:contact).permit(:name, :phn_no, :email, :message)
  	end
end
