class Team < ActiveRecord::Base
  has_many :match_results, :dependent => :destroy
end
