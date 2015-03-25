require 'rails_helper'

RSpec.describe "seasons/index_classification", type: :view do
  before(:all) { Season.delete_all; Team.delete_all }
  after(:all) do
    Team.delete_all
    Season.delete_all
  end

  let!(:season){ FactoryGirl.create(:season, id: 1) }
  it 'shows table, which includes Team data' do
    10.times { FactoryGirl.create(:team) }
    @teams = Team.order(:place)
    render
    expect(rendered).to have_selector('tr', count: 11)
  end

  it "doesn't show Final Stats in case if there are not correct amount of teams" do
    expect(rendered).to_not have_link "Podsumowanie", seasons_path
  end
end