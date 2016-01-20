class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_post , except: [:create, :index]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @comments = Comment.where(post_id: @post.id)
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
