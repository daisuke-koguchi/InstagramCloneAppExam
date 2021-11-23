class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if  @blog.save
      redirect_to blogs_path,notice: "ブログ「#{@blog.title}」を作成しました"
    else
      flash.now[:notice] ="ブログ投稿失敗しました"
      render :new
    end
  end

  def edit
    @blog = Blog.find(parms[:id])
  end

  def update
    
  end

  private
  #あとでpermitに:image,:image_chachを追加
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
