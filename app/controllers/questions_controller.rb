class QuestionsController < ApplicationController

  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new

  end

  def create
    @test = Test.find_by(id: params[:test_id])

    @question = @test.questions.new(question_params)

    if @question.save
      render plain: 'good'
    else
      render plain: 'bad'
    end
  end

  def destroy
    @question = Question.find(params[:id])
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
   @test = Question.find_by(test_id: params[:test_id])
  end
end

