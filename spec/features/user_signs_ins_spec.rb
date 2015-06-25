require 'rails_helper'

RSpec.feature "UserSignsIns", type: :feature do

  scenario "returning user signs in" do
    some_user = Fabricate(:user)
    visit "/"
    click_on "Sign In"
    fill_in "Email", with: some_user.email
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("Welcome back, #{some_user.name}")
    click_on "Sign Out"
    page.should have_content("Welcome to Music City Jams")
  end

  scenario "returning user attempts to sign in with incorrect password" do
    some_user = Fabricate(:user)
    visit "/"
    click_on "Sign In"
    fill_in "Email", with: some_user.email
    fill_in "Password", with: "wrongpassword"
    click_button "Sign In"
    page.should have_content("Sign In")
  end

end
