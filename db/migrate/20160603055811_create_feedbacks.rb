class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email
      t.text :feedback
      t.timestamps null: false
    end
  end
end
