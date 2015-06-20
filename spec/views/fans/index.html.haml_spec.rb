require 'rails_helper'

RSpec.describe "fans/index", type: :view do
  before(:each) do
    assign(:fans, [
      Fan.create!(
        :name => "Name",
        :email => "Email"
      ),
      Fan.create!(
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of fans" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
