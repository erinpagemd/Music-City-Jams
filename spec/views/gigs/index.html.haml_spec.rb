require 'rails_helper'

RSpec.describe "gigs/index", type: :view do
  before(:each) do
    assign(:gigs, [
      Gig.create!(
        :name => "Name",
        :location => "Location",
        :description => "MyText",
        :image => "Image"
      ),
      Gig.create!(
        :name => "Name",
        :location => "Location",
        :description => "MyText",
        :image => "Image"
      )
    ])
  end

  it "renders a list of gigs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
