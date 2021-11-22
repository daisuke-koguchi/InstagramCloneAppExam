class SessionsController < ApplicationController
  #後でskip_before_actionを追加する
  #skip_before_action :login_required, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      binding.pry
      redirect_to users_path
    else
      flash.now[:notice] = 'ログインに失敗しました'
      render :new 
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to users_path
  end
  
end
