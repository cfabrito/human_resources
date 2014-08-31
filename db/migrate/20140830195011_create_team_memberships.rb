class CreateTeamMemberships < ActiveRecord::Migration
  def change
    create_table :team_memberships do |t|
      t.belongs_to :team
      t.belongs_to :person
      t.timestamps
    end
  end
end
