class TeamsController < OwnershipController
  include ChangeTeamMembers

  def index
    @teams = current_user.teams
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id

    if @team.save
      redirect_to [current_user, @team]
    else
      render :new
    end
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to [current_user, @team]
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
    @people = Person.where.not(id: @team.person_ids);
  end

  def add_person
    add_team_member(params[:id], params[:person_id])

    redirect_to :change_people_team
  end

  def remove_person
    remove_team_member(params[:id], params[:person_id])

    redirect_to :change_people_team
  end

  private
    def team_params
      params.require(:team).permit(:name).merge(user_id: current_user.id)
    end
end
