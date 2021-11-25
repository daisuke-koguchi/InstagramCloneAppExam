class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required
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
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'プロフィール編集しました'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'プロフィール削除しました'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, 
                                :photo, :photo_chach)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
