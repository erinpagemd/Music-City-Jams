require 'rails_helper'

RSpec.describe "fans/new", type: :view do
  before(:each) do
    assign(:fan, Fan.new(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new fan form" do
    render

    assert_select "form[action=?][method=?]", fans_path, "post" do

      assert_select "input#fan_name[name=?]", "fan[name]"

      assert_select "input#fan_email[name=?]", "fan[email]"
    end
  end
end
