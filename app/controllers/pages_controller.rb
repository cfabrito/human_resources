class PagesController < ApplicationController

def index
  @teams = Team.all
end

def about
end

def contact
end

end
