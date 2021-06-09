class QuestionsController < ApplicationController

  before_action :find_test, only: [:index, :create, :new ]
  before_action :find_test_on_question, only: [:edit, :show, :create ]
  before_action :find_question, only: [:destroy, :show, :edit, :update, :find_test]

  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show

  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_path
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
  def find_test_on_question
    @question = Question.find(params[:id])
    @test_from_question = Test.find(@question.test_id)
  end

  def find_question
   @question = Question.find(params[:id])
  end
end

