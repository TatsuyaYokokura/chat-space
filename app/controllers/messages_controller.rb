class MessagesController < ApplicationController
  def index
    @groups = current_user.groups    # _aside.hmtlでも使用するためのインスタンス変数の設定
    @group = Group.find(params[:group_id])
    @current_group_users = @group.users
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @group = Group.find(params[:group_id])
    @message = @group.messages.new(message_params)
    if @message.message.present?
      @message.save
      redirect_to group_messages_path(@group)
    else
      flash.row[:alert] = 'メッセージが入力されていません'
      redirect_to group_messages_path(@group)
    end
  end

  private
  def message_params
    params.require(:message).permit(:message, :image).merge(user_id: current_user.id)
  end


end
