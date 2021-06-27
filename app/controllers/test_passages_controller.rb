class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: [:show, :update, :result, :gist, :timer, :compleate_timer]

  def show
    self.timer unless @test_passage.test.timer.zero?
  end

  def result

  end

  def update
    @test_passage.compleated_timer if @test_passage.test.timer.present? && self.is_timer_end?
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed? || @test_passage.test.timer.present? && self.is_timer_end?
      TestsMailer.completed_test(@test_passage).deliver_now
      
      BadgesService.new(@test_passage, current_user).reward_badge if @test_passage.success?
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

  def timer
    @timer = @test_passage.test.timer.minutes.since(@test_passage.created_at).to_i
  end

  def compleate_timer
    @test_passage.compleated_timer
    redirect_to result_test_passage_path(@test_passage)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def is_timer_end?
    @test_passage.test.timer.minutes.since(@test_passage.created_at).to_i <= Time.now.utc.to_i
  end

end
