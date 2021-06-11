class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:current_referrer].present? ? cookies[:current_referrer] : tests_path
      cookies[:current_referrer] = nil
    else
      flash.now[:alert] = 'Are you Guru? Verify yuor Email and Password please'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end