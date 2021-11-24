class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit,:destroy, :update]
  def index
    @blogs = Blog.all
  end

  def user_like
    @blogs = Blog.all 
    @favorite = current_user.favorites.find_by(blog_id: @blogs.ids)
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if params[:back]
      render :new 
    else
      if @blog.save
        ContactMailer.contact_mail(@blog).deliver
        redirect_to blogs_path,notice: "ブログ「#{@blog.title}」を作成しました、写真投稿完了メールを送信しました"
      else
        flash.now[:notice] = "ブログ投稿失敗しました"
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログ「#{@blog.title}」を更新しました"
    else
      flash.now[:notice] = "ブログ投稿失敗しました"
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path,notice: "ブログ「#{@blog.title}」を削除しました"
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content,:image, :image_cache, :user_id)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
