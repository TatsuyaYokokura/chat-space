class MessagesController < ApplicationController

  before_action :current_group

  def index
    @groups = current_user.groups    # _aside.hmtlでも使用するためのインスタンス変数の設定
    @current_group_users = @group.users
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group)
    else
      flash.now[:alert] = 'メッセージを入力してください'
    end
  end

  private
  def message_params
    params.require(:message).permit(:message, :image).merge(user_id: current_user.id)
  end

  def current_group
    @group = Group.find(params[:group_id])
  end

end
