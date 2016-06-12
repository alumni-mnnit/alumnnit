class AddImageToNews < ActiveRecord::Migration
  def self.up
  	change_table :news do |t|
      t.attachment :photo
    end
  end

  def self.down
  	remove_attachment :news, :photo
  end
end
