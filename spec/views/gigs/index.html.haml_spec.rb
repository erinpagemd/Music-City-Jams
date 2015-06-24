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
end
