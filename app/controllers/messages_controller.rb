class MessagesController < ApplicationController

  before_action :setup_group

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group)
    else
      flash.now[:alert] = 'メッセージもしくは写真を登録してください'
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:message, :image, :user_id, :group_id)
  end

  def setup_group
    @group = Group.find(params[:group_id])
    @groups = current_user.groups    # _aside.htmlでも使用するためのインスタンス変数の設定
    @current_group_users = @group.users
    @messages = @group.messages
  end

end
