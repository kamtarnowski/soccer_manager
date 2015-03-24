require 'rails_helper'

RSpec.describe Round, type: :model do
  describe 'after creating a model' do
    context 'associations' do
      it 'should have many matches' do
        association = Round.reflect_on_association(:matches)
        association.macro.should == :has_many
      end
    end

    context 'checking order of the listing' do
      before(:all) do
        let!(:round) { FactoryGirlRails.create(:round) }
        let!(:round_2) { FactoryGirlRails.create(:round) }
        let!(:round_3) { FactoryGirlRails.create(:round) }
      end

      after(:all) { Round.delete_all }

      it 'should have created_at ASC order' do
        Round.order('created_at asc').to_a.should == [round, round_2, round_3]
      end
    end
  end
end
