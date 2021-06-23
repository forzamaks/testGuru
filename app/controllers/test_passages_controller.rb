class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: [:show, :update, :result, :gist, :reward_bage]

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      
      self.reward_bage(:first_success_test) if self.success_on_first_try?
      self.reward_bage(:success_level_tests) if self.succes_on_level? && self.is_uniq_badge?(:success_level_tests)
      self.reward_bage(:sucess_category_test) if self.success_on_category? && self.is_uniq_badge?(:sucess_category_test)
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    response = GistQuestionService.new(@test_passage.current_question)
    result = response.call
    @gist = Gist.new(gist_url: result.html_url, user_id: current_user.id, question_id: @test_passage.current_question.id)

    flash_options = response.success? && @gist.save ? { notice: t('.success', link: result.html_url) } : { alert: t('.failure') }
    redirect_to @test_passage, flash_options
  end

  def success_on_first_try?
    current_user.tests.where(id: @test_passage.test.id).count == 1 && @test_passage.success?
  end

  def succes_on_level?
    current_level = @test_passage.test.level
    test_ids = Test.where(level: current_level).ids
    test_ids == find_completed_test
  end

  def success_on_category?
    category_id = @test_passage.test.category.id
    current_category_tests_ids = @test_passage.test.category.tests.ids
    current_category_tests_ids == find_completed_test_in_category(category_id)
  end


  def reward_bage(type)
    @badge = Badge.where(badge_type: type)
    @user_badge = UserBadge.new(test_id: @test_passage.test.id, user_id: current_user.id, badge_id: @badge.first.id)

    if @user_badge.save
      flash.now[:notice] = t('.success')
    else 
      flash.now[:alert] = t('.failure')
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def find_completed_test
    compleated_ids = []
    TestPassage.all.each{ |item| compleated_ids.push(item.test.id) if item.completed? }
    compleated_ids.uniq
  end

  def find_completed_test_in_category(category_id)
    compleated_ids = []
    TestPassage.all.each{ |item| compleated_ids.push(item.test.id) if item.completed? && item.test.category.id == 1 }
    compleated_ids.uniq
  end

  def is_uniq_badge?(type)
    @badge = Badge.where(badge_type: type)
    @test = @test_passage.test
    @user_badges = UserBadge.where(user_id: current_user.id, badge_id: @badge.first.id, test_id: @test.id)
    @user_badges.blank?
  end

end
