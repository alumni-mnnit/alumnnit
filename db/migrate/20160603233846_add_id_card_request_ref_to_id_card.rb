class AddIdCardRequestRefToIdCard < ActiveRecord::Migration
  def change
    add_reference :id_cards, :id_card_request, index: true, foreign_key: true
  end
end
