class PagesController < ApplicationController
  def index
    if admin_signed_in?
      @users = User.all
    elsif user_signed_in?
      @teams = Team.where(id: current_user.id).includes(:people)
    end
  end

  def about
  end

  def contact
  end
end
