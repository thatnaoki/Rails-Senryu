class ApplicationController < ActionController::Base
    before_action :current_user

    def current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def authenticate_user
      if session[:user_id] == nil
        flash[:notice] = "ログインが必要です"
        redirect_to("/login")
      end
    end

    def forbid_login_user
      if @current_user
        flash[:notice] = "すでにログインしています"
        redirect_to("/posts/index")
      end
    end

end
