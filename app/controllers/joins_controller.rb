class JoinsController < ApplicationController
    def create
        Join.create(user_id: current_user.id, organization_id: params[:organization_id])
        redirect_to "/organizations/#{ params[:organization_id] }"
    end

    def destroy
        Join.where(user_id: current_user.id, organization_id: params[:organization_id]).delete_all
        redirect_to "/organizations/#{ params[:organization_id] }"
    end
end
