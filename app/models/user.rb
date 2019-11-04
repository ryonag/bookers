class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile_image
  has_many :books
  attachment :profile_image
  accepts_attachments_for :profile_image, attachment: :image
  validates :name, presence: true
  validates :name, length: { maximum: 20, minimum: 2 }
  validates :introduction, length: { maximum: 50 }
end
