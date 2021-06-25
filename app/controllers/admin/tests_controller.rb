class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: [:index, :update_inline]
  before_action :find_test, only: [:destroy, :update, :edit, :show, :start, :update_inline]
  before_action :all_unique_categories, only: [:create, :edit]
  def index
    
  end

  def show

  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.tests.new(test_params)
    @test.user_id = current_user.id
    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    if @test.destroy
      redirect_to admin_tests_path
    else
      redirect_to admin_tests_path, alert: t('.error')
    end
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private 

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :timer)
  end

  def set_tests
    @tests = Test.all
  end

  def all_unique_categories
    @categories = Category.all.pluck(:title)
  end

end
