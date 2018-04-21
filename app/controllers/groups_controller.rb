class GroupsController < ApplicationController

  before_action :restrict_user, only: :edit

  def index
    @groups = current_user.groups
    # @group = Group.specify(params[:group_id])
  end

  def new
    @group = Group.new
    @group.users << current_user
    @users_except_from_currentuser = User.except_from_currentuser(current_user)
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      flash.now[:alert] = 'グループを作成できませんでした'
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
    @users_except_from_currentuser = User.except_from_currentuser(current_user)
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      @group.users << current_user
      redirect_to group_messages_path(@group), notice: 'グループを作成しました'
    else
      flash.now[:alert] = 'グループを作成できませんでした'
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def restrict_user
    redirect_to root_path unless current_user.groups.find_by(id: params[:id])
  end
end
