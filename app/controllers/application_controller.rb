class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception| redirect_to root_path, alert: "I'm Sorry You Cannot Access This Page - Please Login To View" end

    helper_method :current_user
    private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
  end
