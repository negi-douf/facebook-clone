class Topic < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  mount_uploader :picture, PictureUploader
end
