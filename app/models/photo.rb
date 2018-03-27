class Photo < ApplicationRecord
  mount_uploader :path, PhotoUploader
end
