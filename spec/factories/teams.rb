FactoryGirl.define do
  factory :team do
    sequence(:name) { |n| "Team #{n}" }
    score 0
  end
end
