class CommentsController < ApplicationController
    before_action :redirect_if_not_signed_in

    def new
        if params[:question_id] && @question = Question.find_by_id(params[:question_id])
            @comment = @question.comments.build
        else
            redirect_to questions_path
        end
    end

    def create
        @question = Question.find_by_id(params[:question_id])
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to question_path(@comment.question)
        else
            render :new
        end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content, :question_id, :user_id)
    end
  end