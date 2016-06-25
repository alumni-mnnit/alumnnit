class Job < ActiveRecord::Base
	belongs_to :user
	validates :title, :description, :url, presence: true
	paginates_per 3
	
	
end
