class QuestionsController < ApplicationController
    before_action :find_question, only: [:edit, :update, :show, :destroy]
    before_action :redirect_if_not_signed_in, only: [:new, :create, :edit, :update, :destroy]
    before_action :redirect_if_not_authorized, only: [:edit, :update, :destroy]

    def index
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @questions = @category.questions
        else
            @questions = Question.all
        end
    end

    def new
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @question = @category.questions.build
        else
            @question = Question.new  
            @question.build_category
        end
    end

    def create
        @question = current_user.questions.build(question_params)
        if @question.valid?
            @question.save
            redirect_to question_path(@question)
        else
            @category = Category.find_by_id(params[:category_id]) if params[:category_id]
            render "new"
        end
    end

    def show
    end

    def edit 
    end

    def update 
        if @question.valid?
            @question.update(question_params)
            redirect_to question_path(@question)
        else 
            render :edit 
        end
    end

    def destroy
        @question.destroy
        redirect_to user_path(current_user)
    end
    
private

    def question_params
        params.require(:question).permit(:title, :content, :category_id)
    end

    def find_question
        @question = Question.find(params[:id])
    end
    
end
