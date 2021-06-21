class FeedbackController < ApplicationController
  def index

  end

  def create
    FormMailer.feedback(params).deliver_now
    redirect_to :index
  end
end