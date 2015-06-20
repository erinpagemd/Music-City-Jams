require 'rails_helper'

RSpec.describe "fans/show", type: :view do
  before(:each) do
    @fan = assign(:fan, Fan.create!(
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
  end
end