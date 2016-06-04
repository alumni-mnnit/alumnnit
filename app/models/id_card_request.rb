class IdCardRequest < ActiveRecord::Base
  belongs_to :user
  has_one :id_card
end
