class SeasonsController < ApplicationController
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
end
