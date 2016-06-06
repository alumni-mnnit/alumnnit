class Convention < ActiveRecord::Base
	has_many :convention_requests, dependent: :destroy
end
