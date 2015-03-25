class Team < ActiveRecord::Base
  before_create :inactive_season

  has_many :match_results
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true

  def inactive_season
    raise 'Sezon jest już rozpoczęty.' if Season.find(1).status == 'active'
  end

  # include Comparable
  #
  # def <=>(other)
  #   self.score <=> other.score
  # end
end
