class CreateConventionRequests < ActiveRecord::Migration
  def change
    create_table :convention_requests do |t|
      t.boolean :status, default: false 
      t.timestamps null: false
    end
  end
end
