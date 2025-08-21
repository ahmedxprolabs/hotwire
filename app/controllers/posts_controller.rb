class PostsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.order(created_at: :desc).page(params[:page]).per(2)
  end


  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to @post, notice: "Post created successfully!" }
        format.turbo_stream
      end
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      respond_to do |format|
        format.html { redirect_to @post, notice: "Post updated successfully!" }
        format.turbo_stream
      end
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: "Post deleted successfully" }
      format.turbo_stream
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
