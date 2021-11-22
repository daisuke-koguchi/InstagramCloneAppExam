class UsersController < ApplicationController
  #後でskip_before_actionを追加する
  #skip_before_action :login_required, only: [:new, :create]
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: 'プロフィール投稿しました'
    else
      render :new 
    end
  end
  

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'プロフィール編集しました'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'プロフィール削除しました'
  end

  private
  # 写真機能作成後、permitに:photoを追加
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, 
                                :photo, :photo_chach)
  end
end
