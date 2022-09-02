class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to logout_path
    end
  end

  def create
    if logged_in?
      redirect_to logout_path
    else
      user = User.find_by(email: params[:session][:email].downcase)
      respond_to do |format|
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          format.html { redirect_to user_path(user), notice: "You have successfully logged in." }
        else
          flash[:unprocessable_entity] = "Wrong email or password"
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "you have successfully logged out"
    redirect_to login_path
  end
end
