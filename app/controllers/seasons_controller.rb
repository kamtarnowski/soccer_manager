class SeasonsController < ApplicationController
  def update
    if Team.count >= 4 && Team.count%2 == 0
      @season = Season.find(1)
      @season.update(status: params[:status].permit(:status))
      create_round(1)
      redirect_to 'rounds#index'
      flash[:notice] = 'Sezon został rozpoczęty'
    else
      redirect_to teams_index_path
      flash[:notice] = 'Brak wystarczającej liczby Drużyn, bądź liczba ich jest nieparzysta.'
    end
  end
end
