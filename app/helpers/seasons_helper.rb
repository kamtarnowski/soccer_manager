module SeasonsHelper
  def create_season
    sum_teams = Team.all.count
    sum_round = sum_teams - 1

    ActiveRecord::Base.connection.execute('truncate match_result')
    ActiveRecord::Base.connection.execute('truncate matchs')
    ActiveRecord::Base.connection.execute('truncate rounds')
    (1..sum_round).each do |i|
        create_round(i)
    end
  end

end
