class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path
      flash[:notice] = 'Dodano Drużynę'
    else
      render 'new'
      flash[:notice] = 'Nie dodano Drużyny'
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
      flash[:notice] = 'Nie zaktualizowano Drużyny'
      redirect_to :back
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
end
