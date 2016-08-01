class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post is created successfully!"
      redirect_to user_path(current_user)
    else
      render 'static_pages/home'
    end
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

end
