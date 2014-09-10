class TeamsController < OwnershipController
  include ChangeTeamMembers

  def index
    @user = User.find(params[:user_id])
    @teams = @user.teams
  end

  def new
    @user = User.find(params[:user_id])
    @team = Team.new
  end

  def create
    @user = User.find(params[:user_id])
    @team = Team.new(team_params)

    if @team.save
      redirect_to [current_user, @team]
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    @team = @user.teams.find(params[:id])

    if @team.update(team_params)
      redirect_to [@user, @team]
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @team = @user.teams.find(params[:id])
  end

  def show
    @user = User.find(params[:user_id])
    @team = @user.teams.find(params[:id])
    @members = @team.people
  end

  def destroy
    @user = User.find(params[:user_id])
    @team = @user.teams.find(params[:id])
    @team.destroy

    redirect_to teams_path
  end

  def change_people
    @user = User.find(params[:user_id])
    @team = @user.teams.find(params[:id])
    @people = @user.people.where.not(id: @team.person_ids);
  end

  def add_person
    add_team_member(params[:id], params[:person_id])

    redirect_to :change_people_user_team
  end

  def remove_person
    remove_team_member(params[:id], params[:person_id])

    redirect_to :change_people_user_team
  end

  private
    def team_params
      params.require(:team).permit(:name).merge(user_id: current_user.id)
    end
end
