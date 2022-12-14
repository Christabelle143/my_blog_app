class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.most_recent_comments
    @likes = @post.likesCounter + 1
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    @post.save
    redirect_to user_posts_path(@user)
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def post_params
    params.require(:post).permit(:title, :text, :commentsCounter, :likesCounter)
  end
end
