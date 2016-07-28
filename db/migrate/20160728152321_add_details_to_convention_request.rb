class AddDetailsToConventionRequest < ActiveRecord::Migration
  def change
  	add_column :convention_requests, :name, :string
  	add_column :convention_requests, :degree, :string
    add_column :convention_requests, :branch, :string
    add_column :convention_requests, :year_of_passing, :date
    add_column :convention_requests, :designation, :string  
    add_column :convention_requests, :address, :text 
    add_column :convention_requests, :is_attending, :string  
	  add_column :convention_requests, :payment, :text
    add_column :convention_requests, :accompanions, :integer
  end
end
