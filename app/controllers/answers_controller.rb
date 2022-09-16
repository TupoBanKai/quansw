class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = question.answers.new(answer_params)
    if @answer.save
      render_success_ok
    else
      render :new
    end
  end

  private

  def question
    Question.find(params['question_id'])
  end

  def answer_params
    params.require(:answer).permit(:title)
  end
end
