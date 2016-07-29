class UserMailer < ApplicationMailer

	def send_mail(email,password)
		@password = password
    	mail(from: "mnnitalumni@mnnit.ac.in",
             to: email,
             subject: "Alumni Portal Password")
    end
end
