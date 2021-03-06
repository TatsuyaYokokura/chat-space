class Message < ApplicationRecord
  # belongs_current_user_to :user
  belongs_to :group
  belongs_to :user

  validates :message, presence: true, unless: :image?
  mount_uploader :image, ImageUploader

end
