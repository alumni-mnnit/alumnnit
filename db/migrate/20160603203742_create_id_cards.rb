class CreateIdCards < ActiveRecord::Migration
  def change
    create_table :id_cards do |t|
      t.string :idNumber
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
