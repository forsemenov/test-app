class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.save
    render :create
  end

  def update
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
