require 'rails_helper'

RSpec.describe "rounds/index.html.erb", type: :view do
  context 'page contains' do
    10.times { create(:round) }
    render
    it 'should have selector tr' do
      expect(rendered).to have_selector('tr', count: 11)
    end
    it 'should have links to round#show' do
      expect(rendered).to have_link 'rounds#show'
    end
  end
end
