class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new

  end

  def create
    @test = Test.new(test_params)

    if @test.save
      render plain: 'good'
    else
      render plain: 'bad'
    end
  end

  def delete

  end

  private 

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
