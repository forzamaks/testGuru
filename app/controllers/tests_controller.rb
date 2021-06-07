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
    @test = Test.create(test_params)

    render plain: @test.inspect
  end

  def delete

  end

  private 

  def test_params
    params.require(:test).permit(:title, :level)
  end
end
