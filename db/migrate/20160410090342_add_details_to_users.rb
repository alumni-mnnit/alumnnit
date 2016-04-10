class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :nick_name, :string 
    add_column :users, :gender, :string
    add_column :users, :reg_no, :string
    add_column :users, :phn_no, :float
    add_column :users, :date_of_birth, :date
    add_column :users, :degree, :string
    add_column :users, :branch, :string
    add_column :users, :year_of_passing, :date
    add_column :users, :curr_address, :text
    add_column :users, :pincode, :float
    add_column :users, :h_town, :string
    add_column :users, :city, :string
    add_column :users, :country, :string, default: "India"
    add_column :users, :company, :string
    add_column :users, :designation, :string
    add_column :users, :achievements, :text
    

  end
end
