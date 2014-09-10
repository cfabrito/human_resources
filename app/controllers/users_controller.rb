class UsersController < ApplicationController
  before_action :authenticate_admin!

  def index

  end

  def show
    @user = User.find(params[:id])
    @teams = @user.teams.includes(:people)
  end
end
