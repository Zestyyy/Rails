class OrganizationsController < ApplicationController
    before_action :require_login, only: [:index, :create, :destroy]

    def index
        @user = User.find(session[:user_id])
        @organizations = Organization.all
    end

    def create
        organization = Organization.create(name: params[:name], description: params[:description], user_id: current_user.id)
        if organization.save
            Join.create(user_id: current_user.id, organization_id: organization.id)
            redirect_to :back
        else
            flash[:error] = organization.errors.full_messages
            redirect_to :back
        end
    end

    def show
        @organization = Organization.find(params[:id])
        @join = Join.where(organization_id: params[:id])
    end

    def destroy
        Organization.find(params[:organization_id]).destroy
        redirect_to '/organizations'
    end
end
