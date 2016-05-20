class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :request, dependent: :destroy
  has_attached_file :pic, styles: { medium: "300x300>" , thumb: "100x100"}
    validates_attachment :pic, presence: true, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
