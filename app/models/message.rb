class Message < ApplicationRecord
  # belongs_current_user_to :user
  belongs_to :group
  belongs_to :user

  # validates :message_valid, presence: true
  validates :message, presence: true, unless: :image?
  mount_uploader :image, ImageUploader

  # def message_valid
  #   (message || image).present?
  # end

end
