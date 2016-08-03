class GroupsController < ApplicationController

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = "You have created a new group. Add your friends to start a conversation!"
      #need to redirect to group/Url
    else
      flash[:danger] = "Something went wrong when creating a group. Please try again."
      redirect_to user_path(current_user)
  end

  private

    def group_params
      params.require(:group).permit(:name)
    end

end
