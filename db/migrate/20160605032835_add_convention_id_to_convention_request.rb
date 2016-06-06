class AddConventionIdToConventionRequest < ActiveRecord::Migration
  def change
  	add_column :convention_requests, :convention_id, :integer
    add_index :convention_requests, :convention_id
  end
end
