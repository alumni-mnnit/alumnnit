class AddUserIdToFeedback < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :user_id, :integer
    add_index :feedbacks, :user_id
  end
end
