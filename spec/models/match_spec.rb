require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'associations in Model' do
    it 'should have many match_results' do
      mr = Team.reflect_on_association(:match_results)
      mr.macro == :has_many
    end
  end
end
