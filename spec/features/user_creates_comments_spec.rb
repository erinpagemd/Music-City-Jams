require 'rails_helper'

RSpec.feature "UserCreatesComments", type: :feature do

  let(:bob){Fabricate(:user, name: "Bob")}

  background do
    Fabricate(:gig, name: "How does my garden grow?")
    visit root_path
  end

  scenario "happy path" do
    some_user = Fabricate(:user)
    signin_as some_user
    click_on "All Shows"
    page.should have_content("How does my garden grow?")
    click_on "How does my garden grow?"
    page.should have_css("h1", text: "How does my garden grow?")
    page.should have_css("h3", text: "Be the first to comment")
    fill_in "comment_body", with: "With lots of love"
    click_on "Publish Comment"
    page.should have_css("p", text: "Posted by")
    page.should have_css("h2", text: "#{some_user.name}")
    page.should have_css("h3", text: "With lots of love")
  end

end
