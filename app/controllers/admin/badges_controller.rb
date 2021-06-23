class Admin::BadgesController < Admin::BaseController

  before_action :find_badge, only: [:destroy, :update, :edit, :show, :start, :update_inline]
  
  def index
    @badges = Badge.all
  end

  def show

  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    if @badge.destroy
      redirect_to admin_badges_path
    else
      redirect_to admin_badges_path, alert: t('.error')
    end
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image_url, :badge_type)
  end
end
