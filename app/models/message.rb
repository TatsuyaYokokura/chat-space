class Message < ApplicationRecord
  # belongs_current_user_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader
end
