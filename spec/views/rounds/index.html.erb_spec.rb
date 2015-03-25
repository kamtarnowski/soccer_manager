require 'rails_helper'

RSpec.describe "rounds/index.html.erb", type: :view do
  after(:all) { MatchResult.delete_all; Match.delete_all; Round.delete_all; Team.delete_all; Season.delete_all  }

  let!(:season){ FactoryGirl.create(:season, id: 1) }
  let!(:round){ FactoryGirl.create(:round, status: 'closed') }
  let!(:match){ FactoryGirl.create(:match, round_id: round.id) }
  let!(:team){ FactoryGirl.create(:team, id: 2) }
  let!(:mr){ FactoryGirl.create(:match_result, match_id: match.id, team_id: team.id) }
  let!(:round2) { FactoryGirl.create(:round, status: 'open') }
  let!(:match2){ FactoryGirl.create(:match, round_id: round2.id) }
  let!(:mr3){ FactoryGirl.create(:match_result, match_id: match2.id) }

  it 'should have selectors tr' do
    @rounds = Round.all
    render
    expect(rendered).to have_selector('tr', count: 3)
  end

  it 'should contain Round, Match, MatchResult, Team attributes' do
    @rounds = Round.all
    render
    expect(rendered).to have_content "#{round.status}"
    expect(rendered).to have_content "#{round.id}"
    expect(rendered).to have_content "#{Team.find(mr.team_id).name}"
    expect(rendered).to have_content "#{mr.scores}"

    expect(rendered).to have_link "Runda #{round2.id}", show_round_path(round2)
  end


  it "doesn't show Final Stats in case if there are not correct amount of teams" do
    MatchResult.delete_all; Match.delete_all; Round.delete_all
    @rounds = Round.all
    render
    expect(rendered).to_not have_link 'Podsumowanie', seasons_path
  end
end
