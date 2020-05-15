class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show, :edit, :update]}
  before_action :forbid_login_user, {only: [:signup, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_name: params[:user_name], name: params[:name], pass: params[:pass])
    if @user.save
      session[:user_id] =@user.id
      flash[:notice] = "ユーザー登録が問題なく完了しました．"
      redirect_to("/users/#{@user.id}")
    else
      render("users/signup")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.user_name = params[:user_name]
    @user.name = params[:name]
    @user.pass = params[:pass]
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(user_name: params[:user_name], pass: params[:pass])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "ユーザー名またはパスワードが間違っています．"
      @user_name = params[:user_name]
      @pass = params[:pass]

      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました．"
    redirect_to("/login")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません．"
      redirect_to("/")
    end
  end

end
