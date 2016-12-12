class PostsController < ApplicationController
  def index
    category = params[:category]
    if category != nil
      @posts = Post.where(category: category)
    else
      @posts = Post.all
    end
  end

  def new
    if !logged_in?
      redirect_to posts_path
    end

    @post = Post.new
  end

  def create
    if !logged_in?
      redirect_to posts_path
    end

    @post = Post.new(post_params)
    if @post.save
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    if !logged_in?
      redirect_to post_path(params[:id])
    end

    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @photos = @post.photos
  end

  def update
    if !logged_in?
      redirect_to post_path(params[:id])
    end

    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      redirect_to edit_post_path(@post)
    end

  end

  def edit
    if !logged_in?
      redirect_to post_path(params[:id])
    end

    @post = Post.find(params[:id])
  end

  private
    def post_params
    params.require(:post).permit(:name, :body, :category)
  end

end
