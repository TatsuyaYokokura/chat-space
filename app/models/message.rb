class Message < ApplicationRecord
  belongs_current_userto :user
  belongs_to :group
end
