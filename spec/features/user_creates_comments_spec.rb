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
  end

end
