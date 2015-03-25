class TeamsController < ApplicationController
  before_action :season_active

  def index
    @teams = Team.order(:id)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:notice] = 'Dodano Drużynę'
      redirect_to teams_path
    else
      flash.now[:notice] = 'Nie dodano Drużyny'
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      flash[:notice] = 'Zaktualizowano Drużynę'
      redirect_to root_path
    else
      flash.now[:notice] = 'Nie zaktualizowano Drużyny'
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    if @team.delete
      flash[:notice] = 'Usunięto Drużynę'
      redirect_to :back
    else
      flash[:notice] = 'Wystąpił problem z usunięciem Drużyny'
      redirect_to :back
    end
  end

  def team_params
    params.require(:team).permit(:name)
  end

  def season_active
    redirect_to rounds_index_path if Season.find(1).status == 'active'
  end
end
