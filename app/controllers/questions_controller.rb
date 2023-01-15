class QuestionsController < ApplicationController
    before_action :set_question, only: %i[update show destroy edit]
    def create
        question = Question.create(question_params)
        flash[:notice] = "Your question has been created"
        redirect_to question_path(question)
    end

    def update
        @question.update(
            body:params[:question][:body],
            user_id:params[:question][:user_id]
        )
        redirect_to question_path(@question), notice: 'Question has been updated'
    end

    def destroy
        @question.destroy
        redirect_to questions_path, notice: 'Question has been deleted'
    end

    def show
    end

    def index
        @question=Question.new
        @questions=Question.all
    end

    def new
        @question=Question.new
    end

    def edit
    end

    private

    def question_params
        params.require(:question).permit(:body,:user_id)
    end

    def set_question
        @question = Question.find(params[:id])
    end
end
