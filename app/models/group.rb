class Group < ApplicationRecord
  has_many :messages
  has_many :group_users
  has_many :users, through: :group_users

  scope :specify, -> (group_id) { find_by(id: group_id) }

  def show_latest_message
    latest_message = messages.last
    if latest_message.present?
      latest_message.message? ? latest_message.message : '画像が投稿されています'
    else
      'まだメッセージはありません'
    end
  end
end
