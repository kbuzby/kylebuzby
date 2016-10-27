class SessionsController < ApplicationController

  def new
  end

  def create
    realPass = File.read("#{Rails.root}/app/assets/config/pass.txt").strip
    realUser = "kyle"

    user = params[:session][:user]
    pass = params[:session][:pass]

    if (user==realUser) && (pass==realPass)
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid credentials"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
