class ConventionRequest < ActiveRecord::Base
	belongs_to :user
	belongs_to :convention
	validates :name,:degree, :branch, :year_of_passing, :designation, :address, :is_attending, :accompanions, presence: true
end
