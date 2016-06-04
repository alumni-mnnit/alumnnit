class RemoveUserIdFromIdCard < ActiveRecord::Migration
  def change
    remove_reference :id_cards, :user, index: true, foreign_key: true
  end
end
