class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: [:start]
  before_action :set_user, only: :start

  def index
    @tests = Test.all
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private 

  def find_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
