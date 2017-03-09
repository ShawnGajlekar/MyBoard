class Comment < ApplicationRecord
  belongs_to :notice
  belongs_to :user
  mount_uploader :file, FileUploader
end
