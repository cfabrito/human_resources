class PeopleController < ApplicationController
  def index
  end
  
  def create
    render text: params[:person].inspect
  end
end
