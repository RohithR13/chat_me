class ApplicationController < ActionController::Base
    helper_method :current_user,:logged_in?
    def current_user
        begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        rescue 
            flash[:error] = "already user is removed or doesnt exist in"
            
           
        end
    end

    def logged_in?
        !!current_user
    end 

    def require_user
        unless logged_in?
          flash[:error] = "You must be logged in to perform that action"
          redirect_to login_path
        end
    end

end
