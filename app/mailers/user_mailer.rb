class UserMailer < ApplicationMailer

	def send_mail(email,password)
		@password = password
    	mail(from: "mnnitalumni@mnnit.ac.in",
             to: email,
             subject: "Alumni Portal Password")
    end

    def send_email(user, email, subject, message)
        @user = user
    	@email = email
    	@subject = subject
    	@message = message
    	mail(from: "mnnitalumni@mnnit.ac.in", 
    		  to: @email,
    		  subject: "#{@subject}" )
    end

    def news_mail(news, user)
        @news = news
        @user = user
        mail(from: "mnnitalumni@mnnit.ac.in", 
              to: @user.email,
              subject: "News" )
        
    end

    def admin_mail(purpose)
        @purpose = purpose
        mail(from: "mnnitalumni@mnnit.ac.in",
               to: "gauravdhanuka2007@gmail.com",
               subject: "New #{@purpose.class} request.")
    end
end
