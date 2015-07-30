class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show 
    @post = Post.find(params[:id])
  end

  def index
    @post = Post.all
  end

	def create
		@post = Post.new(post_params)

    if @post.save
      redirect_to :action => :show, :id => @post.id
    else
      #if @user.errors.any?
      #  flash[:alert] = @user.errors.full_messages
        redirect_to index_page
      #end      
    end
	end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    user = @post.user.id
    @post.destroy
    redirect_to :controller => :users, :action => :show, :id => user
  end

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end
end
  