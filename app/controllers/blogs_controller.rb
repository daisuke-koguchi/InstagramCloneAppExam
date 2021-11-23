class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    binding.pry
    if  @blog.save
      redirect_to blogs_path,notice: "ブログ「#{@blog.title}」を作成しました"
    else
      flash.now[:notice] ="ブログ投稿失敗しました"
      render :new
    end
  end

  def edit
  end

  private
  #あとでpermitに:image,:image_chachを追加
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
