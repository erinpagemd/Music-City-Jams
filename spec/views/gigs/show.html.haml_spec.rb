require 'rails_helper'

RSpec.describe "gigs/show", type: :view do
  before(:each) do
    @gig = assign(:gig, Gig.create!(
      :name => "Name",
      :location => "Location",
      :description => "MyText",
      :image => "Image"
    ))
  end

end
