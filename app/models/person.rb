class Person < ActiveRecord::Base
  belongs_to :user

  has_many :team_memberships
  has_many :teams, through: :team_memberships

  validates :first_name,  presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :phone_number, presence: true, numericality: true
  validates :email, presence: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ },
                    uniqueness: { case_sensitive: false }
  validates :birth_date, presence: true

  # validates :linkedin_url, presence: true

  def name
    return "#{first_name} #{last_name}"
  end
end
