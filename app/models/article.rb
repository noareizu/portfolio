class Article < ApplicationRecord
	mount_uploader :video, VideoUploader
end
