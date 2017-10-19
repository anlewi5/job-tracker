require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = create(:company)
    job = create(:job, title: "work", company: company)
    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "new title"
    click_button "Update Job"

    expect(current_path).to eq("/companies/#{job.company.id}/jobs/#{job.id}")
    expect(page).to have_content("new title")
    expect(page).to_not have_content("work")
  end
end
