class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :degree
      t.string :branch
      t.string :year_of_passing
      t.string :city
      t.string :company
      t.timestamps null: false
    end
  end
end
