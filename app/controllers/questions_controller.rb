class QuestionsController < ApplicationController

  before_action :find_test, only: %i[create]
  before_action :find_question, only: %i[show, destroy]

  #rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.where(test_id: params[:test_id])
  end

  def show

  end

  def new

  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      render plain: 'good'
    else
      render plain: 'bad'
    end
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
    render plain: 'Question was not found'
  end

  def find_test
   @test = Test.find(params[:test_id])
  end

  def find_question
   @question = Question.find(params[:id])
  end
end

