require 'rails_helper'

RSpec.describe "fans/edit", type: :view do
  before(:each) do
    @fan = assign(:fan, Fan.create!(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit fan form" do
    render

    assert_select "form[action=?][method=?]", fan_path(@fan), "post" do

      assert_select "input#fan_name[name=?]", "fan[name]"

      assert_select "input#fan_email[name=?]", "fan[email]"
    end
  end
end
