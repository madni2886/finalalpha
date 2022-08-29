class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  def current_user

    @current_user ||=User.find(session[:user_id]) if session[:user_id]



    end
  def logged_in?
    !!current_user
  end
  def require_user
    if !logged_in?
      flash[:danger]='you must be logged in to perform action '
      redirect_to root_path
    end
  end
  before_action :set_query
  def set_query
    @query=Article.ransack(params[:q])
  end
  end
