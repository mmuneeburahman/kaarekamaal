class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    
    def show
        @user = User.find(current_user.id)
    end

    def edit
        logger.debug "The user edit"
        @user = User.find(params[:id])
    end

    def update
        logger.debug "The user update"
        @user = User.find(params[:id])
        # logger.debug @user
        redirect_to root_path
        
        if @user.update(user_params)
            redirect_to root_path
          else
            render :edit, status: :unprocessable_entity
        end
    end

    def member
        logger.debug "---->The user member"
        @user = User.find(params[:id])
    end

    def makemember
        logger.debug "---->The user makemember"
        # logger.debug params[:cnic]
        # logger.debug params[:user][:cnic]
        User.member(params[:id], params[:user][:cnic])
        redirect_to user_path(params[:id])
    end

    private
    def user_params
        params.require(:case).permit(:firstname, :lastname, :cnic)
    end
end
