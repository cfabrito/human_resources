class PeopleController < OwnershipController
  include ChangeTeamMembers

  def index
    @user = User.find(params[:user_id])
    @people = @user.people
  end

  def new
    @user = User.find(params[:user_id])
    @person = Person.new
  end

  def create
    @user = User.find(params[:user_id])
    @person = Person.new(person_params)

    if @person.save
      redirect_to [@user, @person]
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    @person = @user.people.find(params[:id])

    if @person.update(person_params)
      redirect_to [@user, @person]
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @person = @user.people.find(params[:id])
  end

  def show
    @user = User.find(params[:user_id])
    @person = @user.people.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @person = @user.people.find(params[:id])
    @person.destroy

    redirect_to user_people_path
  end

  def change_teams
    @user = User.find(params[:user_id])
    @person = @user.people.find(params[:id])
    @teams = @user.teams.where.not(id: @person.team_ids);
  end

  def add_to_team
    add_team_member(params[:team_id], params[:id])

    redirect_to :change_teams_user_person
  end

  def remove_from_team
    remove_team_member(params[:team_id], params[:id])

    redirect_to :change_teams_user_person
  end

  private
    def person_params
      params.require(:person).permit(:first_name, :last_name, :phone_number, :email, :birth_date, :linkedin_url).merge(user_id: current_user.id)
    end
end
