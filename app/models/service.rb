class Service < ApplicationRecord
	mount_uploaders :pictures, PicturesUploader
	serialize :pictures, JSON
end
