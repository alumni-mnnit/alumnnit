class CreateIdCardRequests < ActiveRecord::Migration
  def change
    create_table :id_card_requests do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
