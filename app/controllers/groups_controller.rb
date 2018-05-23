class GroupsController < ApplicationController

  before_action :restrict_user, only: :edit
  before_action :specify_which_group_editing, only: [:edit, :update]
  before_action :show_users, only: [:new, :edit]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @users_except_from_currentuser = User.except_from_currentuser(current_user)
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      flash.now[:alert] = 'グループを作成できませんでした'
      render :new
    end
  end

  def edit
    @users_except_from_currentuser = User.except_from_currentuser(current_user)
  end

  def update
    if @group.update(group_params)
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

  def specify_which_group_editing
    @group = Group.find(params[:id])
  end

  def show_users
    @users = User.all
  end

end
