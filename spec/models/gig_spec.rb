require 'rails_helper'

RSpec.describe Gig, type: :model do
  it {should belong_to :user}
  it {should validate_presence_of :user}
  it {should validate_presence_of :name}
  it {should have_many :comments}
end
