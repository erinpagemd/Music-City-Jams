require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should have_many :comments}
    it {should have_many :gigs}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_confirmation_of(:password)}
    it {should validate_presence_of(:password).on(:create)}
    it {should_not validate_presence_of(:password).on(:update)}
    it {should validate_presence_of(:password_confirmation).on(:create)}
    it {should_not validate_presence_of(:password_confirmation).on(:update)}


  end
end
