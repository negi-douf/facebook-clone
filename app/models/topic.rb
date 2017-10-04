class Topic < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :picture, PictureUploader
end
