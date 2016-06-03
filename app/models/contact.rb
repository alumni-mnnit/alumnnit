class Contact < ActiveRecord::Base
	validates :email, :message, presence: true
end
