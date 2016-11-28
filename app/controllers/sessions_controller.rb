class SessionsController < ApplicationController
    def new
        user = User.find_by_email(params[:email])

        if params[:email].empty? || params[:password].empty? || user == nil
            flash[:log_error] = ["Invalid email/password combination"]
            redirect_to '/main'
        elsif user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to '/organizations'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/main'
    end
end
