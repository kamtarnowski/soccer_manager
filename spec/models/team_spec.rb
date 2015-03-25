require 'rails_helper'

RSpec.describe Team, type: :model do

  after(:all) { Season.delete_all; Team.delete_all }
  let!(:season){ FactoryGirl.create(:season, id: 1)}
  let!(:team){ FactoryGirl.create(:team) }
  let!(:team2){ FactoryGirl.create(:team) }

  describe 'associations in Model' do
    it 'should have many match_results' do
      mr = Team.reflect_on_association(:match_results)
      mr.macro == :has_many
    end
  end
  describe 'it has validations' do
    before do
      team.update(name:'Team')
      team2.update(name:'Team')
    end
    it 'should not be the same(:name attribute)' do
      expect(team2).to be_invalid
    end

    before { team.name = '' }
    it 'must be presence of the name attribute' do
      expect(team).to be_invalid
    end

    before { team.name = 'FC' }
    it 'has minimum 3 characters(:name)' do
      expect(team).to be_invalid
    end
  end
end