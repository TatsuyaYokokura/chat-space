class MessagesController < ApplicationController
  def index
    user = User.find(current_user.id)
    @groups = user.groups
  end
end
