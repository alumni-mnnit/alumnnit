class ChangeColumnUsersIsActiveToTrue < ActiveRecord::Migration
    def up
        change_column :users, :is_active, :boolean, :default => true
    end

    def down
        change_column :users, :is_active, :boolean, :default => false
    end
end
