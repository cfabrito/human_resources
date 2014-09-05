class PagesController < ApplicationController
  def index
    @teams = Team.all.includes(:people)
  end

  def about
  end

  def contact
  end
end
