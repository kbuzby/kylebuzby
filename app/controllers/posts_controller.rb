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
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
  end

  def edit
    @post = Post.find(params[:id])
  end

  private
    def post_params
    params.require(:post).permit(:name, :body, :category)
  end

end
