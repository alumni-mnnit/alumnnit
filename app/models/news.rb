class News < ActiveRecord::Base

	validates :title, :description, presence: true
	paginates_per 3
	has_attached_file :photo, styles: { medium: "300x300>" , thumb: "100x100"}
    validates_attachment :photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
    validates_attachment_size :photo, less_than: 3.megabytes
end
