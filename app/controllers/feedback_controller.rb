class FeedbackController < ApplicationController
  def index

  end

  def create
    FormMailer.feedback(params).deliver_now
    redirect_to feedback_index_path
  end
end