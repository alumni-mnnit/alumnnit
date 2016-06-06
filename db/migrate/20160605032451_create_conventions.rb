class CreateConventions < ActiveRecord::Migration
  def change
    create_table :conventions do |t|
      t.date :year
      t.string :start_date
      t.timestamps null: false
    end
  end
end
