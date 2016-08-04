class PostsController < ApplicationController
  before_action :authenticate_user!

  def create


    @post = current_user.posts.build(post_params)
    @post.group_id = 0
    if @post.save
      flash[:success] = "Your post is created successfully!"
      redirect_to root_url
      #redirect to the same page
    else
      render 'static_pages/home'
    end
  end

  private

    def post_params
      params.require(:post).permit(:content, :group_id)
    end

end
