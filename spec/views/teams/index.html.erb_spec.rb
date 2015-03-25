require 'rails_helper'

RSpec.describe "teams/index.html.erb", type: :view do
  describe 'page contains' do
    after(:each) do
      Team.delete_all
      Season.delete_all
    end

    let!(:season){ FactoryGirl.create(:season, id: 1) }
    it 'shows each team inside of table row' do
      10.times { FactoryGirl.create(:team) }
      @teams = Team.order(:id)
      render
      expect(rendered).to have_selector('tr', count: 11)
    end

    it 'view shows Model attributes and links' do
      team = FactoryGirl.create(:team)
      @teams = Team.order(:id)
      render
      expect(rendered).to have_content team.id
      expect(rendered).to have_content team.name
      expect(rendered).to have_link 'Edycja', edit_team_path(team)
      expect(rendered).to have_link 'Usunięcie', teams_destroy_path(team)
    end

    it 'can start Season via proper button' do
      4.times { FactoryGirl.create(:team) }
      @teams = Team.order(:id)
      render
      expect(rendered).to have_selector("input[type=submit][value='Rozpocznij Sezon']")
    end
  end
end
