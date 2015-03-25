class SeasonsController < ApplicationController

  def index
    @rounds = Round.all
    @teams = Team.order(:place)
    sort_by_place
  end

  def new
    MatchResult.delete_all
    Match.delete_all
    Round.delete_all
    Team.delete_all
    Season.find(1).update(status: 'inactive')
    flash[:notice] = 'Przed Sezonem'
    redirect_to teams_path
  end

  def update
    if Team.count >= 4 && Team.count%2 == 0
      @season = Season.find(1)
      @season.update(status: params[:status])
      create_season
      flash[:notice] = 'Sezon został rozpoczęty'
      redirect_to rounds_index_path
    else
      redirect_to teams_path
      flash[:notice] = 'Brak wystarczającej liczby Drużyn, bądź liczba ich jest nieparzysta.'
    end
  end

  def index_classification
    @teams = Team.order(:place)
    sort_by_place
  end
end
