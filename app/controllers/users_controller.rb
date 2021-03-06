class UsersController < ApplicationController
  # before_action :correct_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where(:group_id => 0).paginate(page: params[:page])
    puts @posts
    @post = @user.posts.build
    @group = @user.groups.build
  end

  def following
    @title = "following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def current_user?(user)
      user == current_user
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:warning] = "You are not authorised to access the page you requested."
        redirect_to current_user
      end
    end


end
