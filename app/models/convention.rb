class Convention < ActiveRecord::Base
	has_many :convention_requests, dependent: :destroy
	validates :year, :start_date, presence: true
end
