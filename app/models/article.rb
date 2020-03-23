class Article < ApplicationRecord
	validates :title, :video, :presence => true
	mount_uploader :video, VideoUploader

	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :liking_users, through: :likes, source: :user

	def self.search(search)
	    if search
	      Article.where('title LIKE(?)', "%#{search}%")
	    else
	      Article.all
	    end
	end
end
