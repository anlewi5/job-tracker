# require 'rails_helper'
#
# describe "User creates a new comment" do
#   scenario "a user can create a new comment" do
#     company = create(:company)
#     job = create(:job, company: company)
#     visit company_jobs_path(company, job)
#
#     fill_in "comment[content]", with: "Here is a comment"
#
#     click_button "Create"
#
#     expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
#     expect(page).to have_content("Here is a comment")
#   end
# end
