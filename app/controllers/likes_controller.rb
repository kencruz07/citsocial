class LikesController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    respond_to do |format|
      if current_user.like @post
        format.html { redirect_to :back }
        format.js {}
        format.json { render :json => @post, :status => :created,
          :location => :back }
      else
        format.html { render :back }
        format.json { render :json => @post.errors,
          :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    @post = Post.find params[:id]
    respond_to do |format|
      if current_user.unlike @post
        format.html { redirect_to :back }
        format.js {}
        format.json { render :json => @post, :status => :created,
          :location => :back }
      else
        format.html { render :back }
        format.json { render :json => @post.errors,
          :status => :unprocessable_entity}
      end
    end
  end
end
