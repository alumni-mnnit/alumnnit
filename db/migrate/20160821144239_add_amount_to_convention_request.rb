class AddAmountToConventionRequest < ActiveRecord::Migration
  def change
  	add_column :convention_requests, :pay_amount, :float
  end
end
