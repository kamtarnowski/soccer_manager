require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'before season' do
    context 'adding the teams' do
      it 'should be possible to add a team' do
        let!(:team) { build(:season).team }
        its(team).should be_valid
      end
    end
  end

  describe 'starting season' do

    after(:each) { Team.delete_all }
    after(:each) { Season.delete_all }

    context 'sum of the teams = 4 or more than 4' do
      10.times { build(:team) }

      it "should be valid" do
        let!(:season) { build(:season) }
        expect(season).to be_valid
      end
    end

    context 'sum of the teams < 4' do
        build(:team)

      it "should be invalid" do
        let!(:season) { build(:season) }
        expect(season).to be_invalid
      end
    end

    context 'number of teams must be even' do
      5.times { build(:team) }

      it "has 5 teams and should be invalid" do
        let!(:season) { build(:season) }
        expect(season).to be_invalid
      end
    end

    let!(:season) { build(:season) }

    context "after season starts try to create teams" do
       5.times { build(season).team }
       it { should be_invalid }
      end
    end
  end
end
