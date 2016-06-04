class CreateIdCardCounts < ActiveRecord::Migration
  def change
    create_table :id_card_counts do |t|
      t.integer :batch
      t.integer :count

      t.timestamps null: false
    end
  end
end
