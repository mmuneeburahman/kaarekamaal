class CasesController < ApplicationController
    before_action :authenticate_user!, only: [:new]
    def index
      @cases = current_user.cases
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

    def edit
      @user = User.find(current_user.id)
      @case = @user.cases.find(params[:id])
    end

    def update
      @case = Case.find(params[:id])

      if @case.update(case_params)
        redirect_to case_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def close_case
      Case.close_case(params[:id])
      redirect_to cases_path
    end
    private
    def case_params
      params.require(:case).permit(:title, :type, :location, :description)
    end
end
