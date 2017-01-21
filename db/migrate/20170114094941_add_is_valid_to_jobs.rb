class AddIsValidToJobs < ActiveRecord::Migration
  def change
  	    add_column :jobs, :is_valid, :boolean, default: false
  end
end
