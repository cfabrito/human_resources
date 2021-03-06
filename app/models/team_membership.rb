class TeamMembership < ActiveRecord::Base
  belongs_to :team
  belongs_to :person
  
  validates_uniqueness_of :person_id, :scope => :team_id
end
