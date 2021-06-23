class BadgesController < ApplicationController

  before_action :authenticate_user!
  before_action :get_badges, only: :index

  def index
    # @badges = Badge.all
  end


  private 

  def get_badges
    @badges = Badge.all
  end
end
