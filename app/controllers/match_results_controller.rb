class MatchResultsController < ApplicationController
  def update
    @round = Round.find(params[:round])
    @round_next = Round.where(id: params[:round].to_i + 1)
    @match_results = MatchResult.find(params[:end_round][:match_result].keys)
    if @match_results.each do |mr|
      mr.update(params[:end_round][:match_result][mr.id.to_s].permit(:scores))
    end
      @round.update_attributes(status: 'closed')
      @round_next.update_attributes(status: 'open') unless @round_next.blank?
      played_round(@round)
      flash[:success] = 'Zapisano wyniki meczów'
      if Round.active_rounds.blank?
        redirect_to seasons_path
      else
        redirect_to rounds_index_path
      end
    else
      flash[:error] = "Problem z zapisaniem wyników meczów"
      redirect_to :back
    end
  end
end
