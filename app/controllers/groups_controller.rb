class GroupsController < ApplicationController
  before_action :authenticate_user!

  def show

    @group = Group.find(params[:id])
    @user = current_user
  #  puts current_user
#    puts current_user.id
    session[:group_id] = params[:id]
    puts  session[:group_id]
    #need to change user to those who belongs to group
    @post  = @group.users.find(current_user.id).posts.build

  end

  def create
    @group = current_user.groups.create(group_params)
    if @group.save
      flash[:success] = "You have created a new group. Add your friends to start a conversation!"
      redirect_to group_path(@group.id)
    else
      flash[:danger] = "Group creation was not successful. Please try again."
      redirect_to user_path(current_user)
    end
  end

  private

    def group_params
      params.require(:group).permit(:name)
    end

end
