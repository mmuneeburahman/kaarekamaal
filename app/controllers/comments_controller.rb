class CommentsController < ApplicationController
    def create
        @case = Case.find(params[:case_id])
        # byebug
        # binding.break
        @comment = @case.comments.create(comment_params)
        redirect_to case_path(@case)
    end
    
    def destroy
        @case = Case.find(params[:case_id])
        @comment = @case.comments.find(params[:id])
        @comment.destroy
        redirect_to case_path(@case), status: :see_other
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter, :body, :user_id)
    end
end
