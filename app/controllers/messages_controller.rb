class MessagesController < ApplicationController
  def index
    @groups = current_user.groups    # _aside.hmtlでも使用するためのインスタンス変数の設定
    @group = Group.find(params[:group_id])
    @current_group_users = @group.users
  end
end
