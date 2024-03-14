class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_blog_post, except: %i[index new create] # only: [:show, :edit, :update, :destroy]

  def index
    @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published.sorted
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.published_at = combine_datetime_from_params(params[:blog_post], :published_at)
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to root_path
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end

  def set_blog_post
    @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def combine_datetime_from_params(params, prefix)
    if params[:"#{prefix}(1i)"].blank? || params[:"#{prefix}(2i)"].blank? || params[:"#{prefix}(3i)"].blank? || params[:"#{prefix}(4i)"].blank? || params[:"#{prefix}(5i)"].blank?
      nil
    else
      DateTime.new(params[:"#{prefix}(1i)"].to_i, params[:"#{prefix}(2i)"].to_i, params[:"#{prefix}(3i)"].to_i, params[:"#{prefix}(4i)"].to_i, params[:"#{prefix}(5i)"].to_i)
    end
  end
end
