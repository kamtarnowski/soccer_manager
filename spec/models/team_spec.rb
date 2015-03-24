require 'rails_helper'

RSpec.describe Team, type: :model do
  after(:each) { Team.delete_all }

  describe 'Name of the team must be unique' do
    let!(:team) { FactoryGirlRails.build(:team, name: "Team 1") }
    let!(:team_2) { FactoryGirlRails.build(:team, name: "Team 1") }

    its(team_2) { should be_invalid }
  end

  # describe 'after season starts' do
  #   let!(:season) { FactoryGirlRails.build(:season) }
  #   5.times { FactoryGirlRails.build(:team, season: season) }
  #
  #   context 'attributes of the team' do
  #     it 'should have score 0' do
  #       Team.all.each do |team|
  #         team.score.should == 0
  #       end
  #     end
  #   end
  # end
end