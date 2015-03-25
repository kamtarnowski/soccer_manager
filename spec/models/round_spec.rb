require 'rails_helper'

RSpec.describe Round, type: :model do
  describe 'after creating a model' do
    before(:all) { Match.delete_all ;Round.delete_all }
    after(:all) { Round.delete_all }

    context 'associations' do
      it 'should have many matches' do
        association = Round.reflect_on_association(:matches)
        association.macro == :has_many
      end
    end

    context 'checking order of the listing' do
      let!(:round) { FactoryGirl.create(:round) }
      let!(:round_2) { FactoryGirl.create(:round) }
      let!(:round_3) { FactoryGirl.create(:round) }
      it 'should have created_at ASC order' do
        Round.order('created_at ASC').to_a == [round, round_2, round_3]
      end
    end
  end
end
