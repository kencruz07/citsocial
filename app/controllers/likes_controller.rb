class LikesController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    respond_to do |format|

      if current_user.toggle_like @post
        format.html { redirect_to :back }
        format.js { render :layout => false}
        format.json { render :json => @post, :status => :created,
          :location => :back }
      else
        format.html { redirect_to :back }
        format.json { render :json => @post.errors,
          :status => :unprocessable_entity}
      end
    end
  end
end
