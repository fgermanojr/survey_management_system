class UserSessionsController < ApplicationController
  # helper current_user is defined in application_controller
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to users_path
      # TBD change to Survey Index
    else
      flash[:alert] = "Login failed"
      redirect_to new_user_session_path
    end
  end
end
