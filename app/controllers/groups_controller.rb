class GroupsController < ApplicationController

  before_action :restrict_user, only: :edit

  def new
    @group = Group.new
    @group.users << current_user
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
    @group = Group.find(params[:id])
  end

  def update
  end

  private
  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def restrict_user
    if GroupUser.where(user_id: current_user.id, group_id: params[:id]).nil?
      redirect_to controller: 'devise/sessions#new', action: 'new'
    end
  end

end
