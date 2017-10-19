require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    create(:category, id: 1)
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: 1)

    visit company_job_path(company, company.jobs.first)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end
end
