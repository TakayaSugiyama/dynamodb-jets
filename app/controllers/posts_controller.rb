class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :delete]

  # GET /posts
  def index
    @posts = Post.scan
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new
  
    if @post.replace(post_params)
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  # PUT /posts/1
  def update
    if @post.replace(post_params)
      redirect_to  post_path(@post.id)
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def delete
    Post.delete(@post.id)
    if request.xhr?
      render json: {success: true}
    else
      redirect_to posts_path
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content).to_h
  end
end
