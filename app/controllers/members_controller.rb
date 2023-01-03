class MembersController < ApplicationController
    before_action :authenticate_user!, only: [:new]

    def new
        @user = User.find(current_user.id)
    end

    def create
        @user = User.find(current_user.id)

        if @user.update(user_params)
            redirect_to users(current_user.id)
        else
            render :edit, status: :unprocessable_entity
        end
        # @user = User.find(current_user.id)
    end

    private
    def user_params
      params.require(:user).permit(:is_member, :cnic)
    end
end