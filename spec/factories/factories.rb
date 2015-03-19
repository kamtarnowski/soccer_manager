FactoryGirl.define do

  factory :round do
    match do
      status true
      match_result do
        point 3
        scores 2
        team do
          sequence(:name) { |n| "Team #{n}" }
          score 10
        end
      end
    end
  end

end