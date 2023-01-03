class CasesController < ApplicationController
    before_action :authenticate_user!, only: [:new]
    def index
    end

    def show
        @case = Case.find(params[:id])
    end

    def new
        @user = User.find(current_user.id)
        @case = @user.cases.new
    end

    def create
        @user = User.find(current_user.id)
        @case = @user.cases.create(case_params)
        if @case.save
            redirect_to root_path
          else
            render :new, status: :unprocessable_entity
          end
    end

    private
    def case_params
      params.require(:case).permit(:title, :type, :location, :description)
    end
end
