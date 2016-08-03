class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @post  = current_user.posts.build
      @group = current_user.groups.create
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def help
  end
end
