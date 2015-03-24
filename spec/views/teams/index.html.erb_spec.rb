require 'rails_helper'

RSpec.describe "teams/index.html.erb", type: :view do
  10.times { FactoryGirlRails.build(:team) }

  render

  expect(rendered).to have_selector("tr", count: 11)
end
