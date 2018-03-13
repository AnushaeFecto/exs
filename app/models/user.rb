class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :items, dependent: :destroy
  has_many :requested_deals, class_name: "Deal", foreign_key: "requester_id"
  has_many :answered_deals, class_name: "Deal", foreign_key: "answerer_id"

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true
  mount_uploader :photo, PhotoUploader


end
