require 'rails_helper'

RSpec.describe "seasons/index", type: :view do

  before(:all) do
    FactoryGirl.create(:season, id: 1)
    5.times { FactoryGirl.create(:team) }
  end
  after(:all) do
    Round.delete_all
    Team.delete_all
    Season.delete_all
  end
  let!(:round){ FactoryGirl.create(:round, status: 'open') }
  let!(:team){ FactoryGirl.create(:team) }

  it 'shows Round data' do
    @rounds = Round.all
    @teams = Team.order(:place)
    render
    expect(rendered).to have_content round.id
    expect(rendered).to have_content round.status
    expect(rendered).to have_link "Runda #{round.id}", show_round_path(round)
  end

  it 'shows Team data' do
    @rounds = Round.all
    @teams = Team.order(:place)
    render
    expect(rendered).to have_content team.place
    expect(rendered).to have_content team.name
    expect(rendered).to have_content team.score
  end
end