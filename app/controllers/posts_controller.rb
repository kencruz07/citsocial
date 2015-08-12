class PostsController < ApplicationController

  def index
    if session[:user_id].blank?
      redirect_to root_url
    else
       @posts = current_user.timeline.latest.page params[:page]
       @post = current_user.posts.build
    end
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build post_params
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path }
        format.js { render :layout => false }
        format.json { render :json => @post, :status => :created,
          :location => @post }
      else
        format.html { render 'new' }
        format.json { render :json => @post.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]

    if @post.update_attributes(post_params)
      redirect_to @post
    else
      flash[:alert] = @post.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to :back
  end

  def post_params
    params.require(:post).permit :title, :content, :attachment_attributes => [:image]
  end

end

