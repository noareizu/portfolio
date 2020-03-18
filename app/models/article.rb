class Article < ApplicationRecord
	validates :title, :video, :presence => true
	mount_uploader :video, VideoUploader

	belongs_to :user

end
