class AddUserIdToConventionRequest < ActiveRecord::Migration
  def change
  	add_column :convention_requests, :user_id, :integer
    add_index :convention_requests, :user_id
  end
end
