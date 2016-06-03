class Feedback < ActiveRecord::Base
	belongs_to :user
	validates :email, :feedback , presence: true
end
