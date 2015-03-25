FactoryGirl.define do
  factory :team do
    sequence(:name) { |n| "Team #{n}" }
    score 0
    place 1
  end
end
