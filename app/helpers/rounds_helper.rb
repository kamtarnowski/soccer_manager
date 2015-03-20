module RoundsHelper

  def check_match(team, round)
    team.match_results.each do |mr|
      if mr.match.round.id == round.id
        return true
      end
    end
    false
  end

  def have_same_match?(team1, team2)
    array1 = []
    array2 = []
    team1.match_results.each do |mr|
      array1 << mr.match.id
    end
    team2.match_results.each do |mr|
      array2 << mr.match.id
    end
    array1.each do |a1|
      array2.each do |a2|
       return true if a1 == a2
      end
    end
    false
  end

  def create_round(number)
    @round = Round.create(status: 'new', number: number)
    @list = Team.all
    @list.each do |team|
      next if check_match(team, @round)
      @list.each do |team2|
        next if team == team2
        next if check_match(team2, @round)
        unless have_same_match?(team, team2)
         @match = Match.create
          @match_results = MatchResult.create(match_id: @match.id, team_id: team.id )
          @match_results = MatchResult.create(match_id: @match.id, team_id: team2.id )
        end
      end
    end
  end

  def played_round(round)
    round.matches.each do |match|
      max = 0
      min = 10000
      match.match_results.each do |mr|
       max = mr.score if mr.score > max
       min = mr.score if mr.score < min
      end
      match.match_results.each do |mr|
      if max == min
        mr.points = 1
      elsif mr.score == max
        mr.points = 2
      else
        mr.score == 0
      end
      mr.team.score = mr.team.score + mr.points
      end
    end
  end
end
