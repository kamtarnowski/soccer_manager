FactoryGirl.define do
  factory :round do
    sequence(:number) { |n| n }
    status 'inaccessible'
  end
  #
  # factory :round2, class: Round do
  #   sequence(:number) { |n| n }
  #   status 'inaccessible'
  #   factory :matches, class: Match {[FactoryGirl.create(:match)]}
  # end
  #
  # factory :round3, class: Round do
  #   sequence(:number) { |n| n }
  #   status 'inaccessible'
  #
  #
  # end

end