class ChangeColumnPhnNoFloatToString < ActiveRecord::Migration
    def up
        change_column :users, :phn_no, :string
    end

    def down
        change_column :users, :phn_no, :float
    end
end
