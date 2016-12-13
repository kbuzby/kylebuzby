class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url
    end
  end

  def edit
  end

  def destroy
    if !logged_in?
      redirect_to root_url
    end

    @user = User.find(params[:id])
    @user.delete
  end

  private
    def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
