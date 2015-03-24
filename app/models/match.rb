class Match < ActiveRecord::Base
  belongs_to :round, :dependent => :destroy
  has_many :match_results
  default_scope -> { order(created_at: :asc) }
end
