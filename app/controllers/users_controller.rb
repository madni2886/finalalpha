class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def index
    if logged_in?
      @user = User.page(params[:page]).per(4)
    else
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      flash[:success] = "Welcome to the alpha blog #{@user.username}"

      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def edit
    if (logged_in?)
    else
      redirect_to login_path
    end
  end

  def update
    if (logged_in?)
      if @user.update(user_params)
        flash[:success] = "Your account was updated successfully"

        redirect_to articles_path
      end
    else
      redirect_to login_path
    end
  end

  def show
    if (logged_in?)
    else
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
