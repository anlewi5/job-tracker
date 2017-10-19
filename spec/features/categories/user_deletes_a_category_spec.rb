require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    create(:category, title: "work")
    visit categories_path

    click_on "Delete"

    expect(page).to have_content("work was successfully deleted!")
  end
end
