class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User has been created."
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :new
    end

    def show
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :user_name, :password, :password_confirmation)
  end
end
