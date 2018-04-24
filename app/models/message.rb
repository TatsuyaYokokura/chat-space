class Message < ApplicationRecord
  belongs_current_userto :user
  belongs_to :group
  mount_uploader :image, ImageUploader
end
