class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    @post = @user.posts.build
  end

end
