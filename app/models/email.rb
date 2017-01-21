class Email < ActiveRecord::Base
	validates :batch, :subject, :message, presence: true
end
