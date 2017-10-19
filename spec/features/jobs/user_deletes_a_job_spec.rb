require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = create(:company)
    create(:job, title: "work", company: company)
    visit company_jobs_path(company)

    click_on "Delete"

    expect(page).to have_content("work was successfully deleted!")
  end
end
