class AddAttachmentImageToRequest < ActiveRecord::Migration
  def self.up
  	change_table :requests do |t|
      t.attachment :image
    end
  end

  def self.down
  	remove_attachment :requests, :image
  end
end
