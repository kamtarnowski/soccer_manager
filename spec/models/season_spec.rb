require 'rails_helper'

RSpec.describe Season, type: :model do

  after(:all) { Season.delete_all }
  after(:each) { Team.delete_all }
  let!(:season){ FactoryGirl.create(:season, id: 1) }

  describe 'before season' do
    context 'adding the teams' do
      let!(:team){ FactoryGirl.create(:team) }
      it 'should be possible to add a team' do
        expect(team).to be_valid
      end
    end
  end

  describe 'starting season' do
    before { season.status = 'active' }
    let!(:team) { FactoryGirl.create(:team) }
    it "after season starts cannot create teams" do
      expect { raise "Sezon jest już rozpoczęty." }.to raise_error
    end
  end

  describe 'invalid attributes' do
    before { season.status = 'invalid' }
    it 'must be correct status attribute' do
      expect(season).to be_invalid
    end
  end
end
