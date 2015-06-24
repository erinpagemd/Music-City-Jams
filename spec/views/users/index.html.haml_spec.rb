require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :email => "Email"
      ),
      User.create!(
        :name => "Name",
        :email => "Email"
      )
    ])
  end

end
