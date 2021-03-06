module Features
  module SessionHelpers
    def signin_as(user_or_user_type, options = {})
      user = (user_or_user_type.is_a? Symbol)? Fabricate.build(user_or_user_type, options) : user_or_user_type
      password = user.password || "password1"
      user.save!

      signin_as_user(user, password)
      user
    end

    def signin_as_user(user, password)
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: password
      click_button "Sign In"
      page.should have_content("Welcome back")
    end
  end
end

RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
end
