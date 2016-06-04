class IdCardRequest < ActiveRecord::Base
  belongs_to :user
  has_one :id_card

  before_update :generate_id_card_number, if: :status

  def generate_id_card_number
    year = self.user.year_of_passing.year
    id_card_count = IdCardCount.find_by batch: year
    if id_card_count.nil?
      id_card_count = IdCardCount.new batch: year, count: 0
    end
    id_card_count.count += 1
    id_card_number = "#{year}/#{self.user.degree}/#{self.user.branch}/#{id_card_count.count.to_s.rjust(3, '0')}"
    self.id_card = IdCard.new id_number: id_card_number
    id_card_count.save
  end
end
