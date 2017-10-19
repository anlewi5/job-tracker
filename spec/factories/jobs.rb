FactoryGirl.define do
  factory :job do
    sequence(:title) { |n| "Job #{n}" }
    sequence(:description) { |n| "Desc #{n}" }
    sequence(:city) { |n| "City #{n}" }
    level_of_interest 5
    company
    category
  end
end
