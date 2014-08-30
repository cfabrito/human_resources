class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end
  
  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(team_params)
 
    if @team.save
      redirect_to @team
    else
      render :new
    end
  end
  
  def update
    @team = Team.find(params[:id])
    
    if @team.update(team_params)
      redirect_to @team
    else
      render :edit
    end
  end
  
  def edit
    @team = Team.find(params[:id])
  end
  
  def show
    @team = Team.find(params[:id])
    @members = @team.people
  end
  
  def destroy
    @team = Team.find(params[:id])
    @team.destroy
 
    redirect_to teams_path
  end
  
  def change_people
    @team = Team.find(params[:id])
    @people = Person.where.not(:id => @team.person_ids);
    
  end
  
  def add_person
    @team = Team.find(params[:id])
    @person = Person.find(params[:person_id])
    @team.people << @person
    
    redirect_to :change_people_team
  end
  
  def remove_person
    @team = Team.find(params[:id])
    @person = Person.find(params[:person_id])
    @team.people.delete(@person)
    
    redirect_to :change_people_team
  end
  
  private
    def team_params
      params.require(:team).permit(:name)
    end
end
