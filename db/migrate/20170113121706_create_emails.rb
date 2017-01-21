class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :batch
      t.string :subject
      t.text   :message
      t.timestamps null: false
    end
  end
end
