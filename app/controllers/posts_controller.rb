class PostsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :find_post, only: [:edit, :update, :show, :delete]
  before_action :authenticate, only: [:edit, :update, :destroy]


  def index
    @posts = Post.search(params[:search])
    @categories = Category.all
    # @posts = Post.order(created_at: :asc)
  end

  def new
    @categories = Category.all
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = "New post created"
      redirect_to posts_path(@post)
    else
      flash[:alert] = "Error creating new post"
      render 'new'
    end
  end

  def edit
    @categories = Category.all
    if authenticate
      render 'edit'
    else
      flash[:alert] = "You can only edit your own post"
      redirect_to posts_path
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post Updated"
      redirect_to posts_path(@post)
    else
      flash[:alert] = "Error updating post"
      render 'edit'
    end
  end

  def show
    @posts = Post.friendly.find(params[:id])
  end

  def destroy
    if find_post.destroy
      flash[:notice] = "Post deleted"
      redirect_to posts_path
    else
      flash[:alert] = "Error deleting post"
    end
  end

  def self.search(search)
    if search && search != 'all'
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      params[:search] = nil
      find(:all)
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :category_id, :image, :longitude, :latitude, :address, :region_id, :subregion_id, :neighborhood_id)
    end

    def find_post
      @post = Post.friendly.find(params[:id])
    end

    def authenticate
      @post = Post.friendly.find(params[:id])
      current_user.id == @post.user_id
    end
end
