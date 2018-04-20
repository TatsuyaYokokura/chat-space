class GroupsController < ApplicationController

  before_action :unassign_user, only: :edit

  def new
    @group = Group.new
    choose_users
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
  end

  def update
  end

  private
  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def choose_users
    @group.users << current_user
  end

  def unassign_user
    if GroupUser.where(user_id: current_user.id, group_id: params[:id]) == nil
      redirect_to controller: 'devise/sessions#new', action: 'new'
    end
  end

end
