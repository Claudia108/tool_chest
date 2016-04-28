class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(user_name: params[:session][:user_name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_tools_path(@user)
    else
      flash[:error] = "Invalid Login"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
