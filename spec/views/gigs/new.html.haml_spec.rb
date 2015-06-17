require 'rails_helper'

RSpec.describe "gigs/new", type: :view do
  before(:each) do
    assign(:gig, Gig.new(
      :name => "MyString",
      :location => "MyString",
      :description => "MyText",
      :image => "MyString"
    ))
  end

  it "renders new gig form" do
    render

    assert_select "form[action=?][method=?]", gigs_path, "post" do

      assert_select "input#gig_name[name=?]", "gig[name]"

      assert_select "input#gig_location[name=?]", "gig[location]"

      assert_select "textarea#gig_description[name=?]", "gig[description]"

      assert_select "input#gig_image[name=?]", "gig[image]"
    end
  end
end
