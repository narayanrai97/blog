class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post Created!"
      redirect_to @post
    else
      flash[:success] = "Post NOT Created!"
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Post deleted!"
      redirect_to posts_path
    else
      render 'destroy'
    end
  end

  private

  def post_params
    params.require(:post)
          .permit(:title, :body)
  end
end

