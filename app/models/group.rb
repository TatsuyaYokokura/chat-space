class Group < ApplicationRecord
  has_many :messages
  has_many :group_users
  has_many :users, through: :group_users

  scope :specify, -> (group_id) { find_by(id: group_id) }
end
