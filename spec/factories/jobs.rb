FactoryGirl.define do
  factory :job do
    title "Job"
    description "Desc"
    city "Denver"
    level_of_interest 5
    company
    category
  end
end