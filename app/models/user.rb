class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages
  has_many :group_users
  has_many :groups, through: :group_users
  validates :name, presence: true

  scope :except_from_currentuser, -> (current_user) { where.not(id: current_user.id) }
end
