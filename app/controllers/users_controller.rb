class UsersController < ApplicationController
  before_action :correct_user, only: [:show]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    @post = @user.posts.build
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
