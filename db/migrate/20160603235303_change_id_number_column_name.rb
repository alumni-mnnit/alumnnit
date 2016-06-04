class ChangeIdNumberColumnName < ActiveRecord::Migration
  def change
    rename_column :id_cards, :idNumber, :id_number
  end
end
