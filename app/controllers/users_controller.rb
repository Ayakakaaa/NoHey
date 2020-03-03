class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :find_user, only: [:show, :edit, :image_destroy]
    before_action :authorize!

    def show
        @sent_request = Request.where(requester_id: current_user.id, requested_id: @user.id).last
        @received_request = Request.where(requester_id: @user.id, requested_id: current_user.id).last
    end

    def edit
    end

    def update
        if @user.update
            @user.images.attach(params[:images])
            flash[:succese] = "Updated"
            ridirect_to @user
        else
            flash[:danger] = "Failed update"
            ridirect_to @user
        end
    end

    def image_destroy
        image = current_user.images.where(id: params[:image_id])
        if image.purge
            redirect_to current_user
        else
            flash[:denger] = "Can't delete"
            redirect_to current_user
        end
    end

    private

    def find_user
        @user = User.find_by(id: params[:id])
    end

    def authorize! 
        unless can?(:crud, @user)
            redirect_to root_path, alert: 'Not Authorized' 
        end
      end
end
