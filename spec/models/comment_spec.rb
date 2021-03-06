require 'rails_helper'

RSpec.describe Comment, type: :model do
  it {should belong_to :gig}
  it {should belong_to :user}
  it {should validate_presence_of :body}
  it {should validate_presence_of :gig}
  it {should validate_presence_of :user}

end
