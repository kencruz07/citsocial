class LikesController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    current_user.like @post
    redirect_to :back
  end

  def destroy
    @post = Post.find params[:id]
    current_user.unlike @post
    redirect_to :back
  end
end
