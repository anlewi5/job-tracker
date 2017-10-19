require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create!(name: "ESPN")
    create(:category, id: 1)
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: 1)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content("ESPN")
  end
end
