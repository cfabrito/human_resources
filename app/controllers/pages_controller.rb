class PagesController < ApplicationController
  def index
    if user_signed_in?
      @teams = Team.where(id: current_user.id).includes(:people)
    elsif admin_signed_in?
      @users = User.all
    end
  end

  def about
  end

  def contact
  end
end
