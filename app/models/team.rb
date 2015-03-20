class Team < ActiveRecord::Base
  has_many :match_results, :dependent => :destroy
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
end
