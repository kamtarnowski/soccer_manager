class Team < ActiveRecord::Base
  has_many :match_results
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true

  # include Comparable
  #
  # def <=>(other)
  #   self.score <=> other.score
  # end
end
