class MembersController < ApplicationController
    before_action :authenticate_user!, only: [:new]

    def new
        @user = User.find(current_user.id)
    end

    def create
    end
end