class GroupsController < ApplicationController
  before_action :authenticate_user!

  def show
    @group = Group.find(params[:id])
    @post = @group.users.where(:user_id == current_user.id).first.posts.build
    @user = current_user
  end

  def create
    @group = current_user.groups.create(group_params)
    if @group.save
      flash[:success] = "You have created a new group. Add your friends to start a conversation!"
      redirect_to group_path(@group.id)
    else
      flash[:danger] = "Something went wrong when creating a group. Please try again."
      redirect_to user_path(current_user)
    end
  end

  private

    def group_params
      params.require(:group).permit(:name)
    end

end
