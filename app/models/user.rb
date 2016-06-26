class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #attr_accessor :is_admin, :is_super_admin, :is_active
  ROLES = %i[alumni student teacher]
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :request, dependent: :destroy
  has_one :id_card_request, dependent: :destroy
  has_one :id_card, through: :id_card_request, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_one :convention_request, dependent: :destroy 
  has_many :jobs, dependent: :destroy
  has_attached_file :pic, styles: { medium: "300x300>" , thumb: "100x100"}
    validates_attachment :pic, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
    validates_attachment_size :pic, less_than: 3.megabytes

    def admin?
      self.is_admin
    end

    def super_admin?
      self.is_super_admin
    end  

end
