class Team < ActiveRecord::Base
  belongs_to :user

  has_many :team_memberships
  has_many :people, through: :team_memberships

  validates :name, presence: true
end
