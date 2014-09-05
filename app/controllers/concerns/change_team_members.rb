module ChangeTeamMembers
  extend ActiveSupport::Concern

  def add_team_member(team_id, person_id)
    @team = Team.find(team_id)
    @person = Person.find(person_id)

    @team.people << @person
  end

  def remove_team_member(team_id, person_id)
    @team = Team.find(team_id)
    @person = Person.find(person_id)

    @team.people.delete(@person)
  end
end
