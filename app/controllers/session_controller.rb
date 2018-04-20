class SessionController < ApplicationController

  def login
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successfully logged in!"
      redirect_to posts_path(:filters => "casual-encounters")
    else
      flash[:alert] = "Invalid login. Please try again"
      render 'login'
    end
  end

  def logout
    session.clear
    redirect_to posts_path(:filters => "casual-encounters")
  end
end
