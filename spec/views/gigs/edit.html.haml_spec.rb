require 'rails_helper'

RSpec.describe "gigs/edit", type: :view do
  before(:each) do
    @gig = assign(:gig, Gig.create!(
      :name => "MyString",
      :location => "MyString",
      :description => "MyText",
      :image => "MyString"
    ))
  end

end
