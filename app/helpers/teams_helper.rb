module TeamsHelper
  # def sort_by_place
  #   num = 1
  #     Team.all.sort { |team1, team2| team2.score <=> team1.score }.each do |team|
  #       @team = Team.all.to_a
  #       @team2 = Team.where(id: team.id)
  #       rmv_team = @team - @team2
  #       if rmv_team.each do |rmv|
  #         if rmv.score == team.score
  #         team.update(place: num)
  #         break
  #         end
  #       end
  #       end
  #       team.update(place: num)
  #       num += 1
  #     end
  # end

  def sort_by_place
    Team.all.to_a.group_by(&:score).to_a.map(&:last).each_with_index { |t, index| t.each { |team| team.update(place: index + 1)}}
  end
end