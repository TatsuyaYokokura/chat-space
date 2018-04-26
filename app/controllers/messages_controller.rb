class MessagesController < ApplicationController
  def index
    @groups = current_user.groups    # _aside.hmtlでも使用するためのインスタンス変数の設定
    @group = Group.find(params[:group_id])
    @current_group_users = @group.users
    @message = Message.new
  end

  def create
    binding.pry
    @group = Group.find(params[:group_id])
    @message = @group.message.new(message_params)
    @message.save
    render :index
  end

  private
  def message_params
    params.require(:message).permit(:message, :image)
  end


end
