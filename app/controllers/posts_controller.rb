class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_post,                only: [:edit, :update, :destroy]

  def follow
    @post = Post.find(params[:post_id])
    current_user.follows.create!(post: @post)
    redirect_to @post, notice: 'You are now following this request.'
  end

  def unfollow
    @post = Post.find(params[:post_id])
    current_user.follows.where(post: @post).first.destroy
    redirect_to @post, notice: 'You unfollowed this request.'
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post.increment! :view_count
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    def set_post
      @post = current_user.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
