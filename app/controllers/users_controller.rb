class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :show, :delete]

def new
  @user = User.new
end

def create
  @user = User.new(user_params)

  if @user.save
    flash[:notice] = "Successfully created a new user!"
    redirect_to user_path(@user)
  else
    flash[:alert] = "Error creating new user!"
    render 'new'
  end
end

def edit
end

def update
  if @user.update(user_params)
    flash[:notice] = "Successfully updated user!"
    redirect_to users_path(@user)
  else
    flash[:user] = "Error editing user!"
    render 'edit'
  end
end

def show
end

def destroy
  if current_user.id == @user.id
    flash[:notice] = "Successfully deleted user!"
    redirect_to users_path
  else
    flash[:alert] = "Error deleting user!"
  end
end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
