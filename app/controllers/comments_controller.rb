class CommentsController < ApplicationController
    def create
        @case = Case.find(params[:case_id])
        # byebug
        # binding.break
        @comment = @case.comments.create(comment_params)
        redirect_to case_path(@case)
      end
    
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body, :user_id)
    end
end
