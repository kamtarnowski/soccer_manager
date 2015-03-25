module RoundsHelper

  def have_same_match?(team1, team2)
    array1 = []
    array2 = []
    team1.match_results.each do |mr|
      array1 << mr.match.id
    end
    team2.match_results.each do |mr|
      array2 << mr.match.id
    end
    array1.each do |array|
          return true if array2.include?(array)
    end
    false
  end

  def create_round(number)
    if number == 1
      @round = Round.create(status: 'open', number: number)
    else
      @round = Round.create(status: 'inaccessible', number: number)
    end
    @list = Team.all
    @list.each do |team|
      next if has_same_round?(team, @round.id)
      @list.each do |team2|
        next if team == team2
        next if has_same_round?(team2, @round.id)
        unless have_same_match?(team, team2)
         @match = Match.create(round_id: @round.id)
          MatchResult.create(match_id: @match.id, team_id: team.id )
          MatchResult.create(match_id: @match.id, team_id: team2.id )
          break
        end
      end
    end
  end

  def has_same_round?(team, round)
      team.match_results(true).each do |mr|
        if mr.match.round_id == round
          return true
        end
      end
    false
  end

  def played_round(round)
    round.matches.each do |match|
      max = 0
      min = 10000
      match.match_results.each do |mr|
       max = mr.scores if mr.scores > max
       min = mr.scores if mr.scores < min
      end
      match.match_results.each do |mr|
      if max == min
        mr.points = 1
      elsif mr.scores == max
        mr.points = 2
      else
        mr.scores == 0
        mr.points = 0
      end
      mr.team.update(score: mr.team.score + mr.points)
      end
    end
  end
end
