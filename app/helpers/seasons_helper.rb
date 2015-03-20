module SeasonsHelper
  def create_season
    sum_teams = Team.all.count
    sum_round = sum_teams - 1

    ActiveRecord::Base.connection.execute("truncate TABLE match_results")
    ActiveRecord::Base.connection.execute("truncate TABLE matches CASCADE")
    ActiveRecord::Base.connection.execute("truncate TABLE rounds CASCADE")
    (1..sum_round).each do |i|
        create_round(i)
    end
  end

end
