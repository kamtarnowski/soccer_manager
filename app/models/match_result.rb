class MatchResult < ActiveRecord::Base
  belongs_to :team, :dependent => :destroy
  belongs_to :match, :dependent => :destroy
end
