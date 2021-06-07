class QuestionsController < ApplicationController

  before_action :find_test, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    @question = Question.find(params[:id])
  end

  def new

  end

  def create
    @question = Question.create(question_params)

    render plain: @question.inspect
  end

  def destroy
    @question.destroy

    render html: '<h1>Question destroy</h1>'.html_safe
  end


  private

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was noy found'
  end

  def find_test
    @test = Question.find(params[:id]).test
  end
end

