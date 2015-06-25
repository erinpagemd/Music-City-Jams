require 'rails_helper'

RSpec.feature "UserAddsGigs", type: :feature do
  scenario "happy path" do
    some_user = Fabricate(:user)
    signin_as some_user
    click_on "Add a new show"
    fill_in "Name", with: "Sunday Matinee"
    click_on "Create Gig"
    page.should have_css("p", text: "Gig was successfully created")
    page.should have_css("h1", text: "#{some_user.name}")
    page.should have_css("h1", text: "Sunday Matinee")
  end

  scenario "sad path" do
    some_user = Fabricate(:user)
    signin_as some_user
    click_on "Add a new show"
    click_on "Create Gig"
    page.should have_css(".alert", text: "Please review the problems below")
  end
end
