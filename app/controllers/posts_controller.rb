class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.new
    @post = current_user.posts.build(post_params)

    if session[:group_id].to_i > 1
      @post.group_id = session[:group_id]
    else
      @post.group_id = 0
    end

    if @post.save
      flash[:success] = "Your post is created successfully!"
      session.delete(:group_id)
      redirect_to request.referrer
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
