class UsersController < ApplicationController
    before_action :require_login, except: [:index, :create] # User Authentication
    before_action :require_correct_user, only: [:show, :edit, :update, :destroy] # User Authorization. Prevents admin access of other users' page
    
    def index
    end

    def create
        user = User.new(first_name: params[:f_name], last_name: params[:l_name], email: params[:email], password: params[:password], password_confirmation: params[:confirm_pw])
        if user.save
            session[:user_id] = user.id
            redirect_to '/organizations'
        else
            flash[:error] = user.errors.full_messages
            redirect_to :back
        end
    end
end
