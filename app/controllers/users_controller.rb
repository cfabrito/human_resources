class UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @teams = @user.teams.includes(:people)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User removed."
    redirect_to users_path
  end
end
