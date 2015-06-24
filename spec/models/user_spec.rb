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
    it "should allow valid values for email" do
      should allow_value("erin@page.com", "a@b.co.uk", "erin+hash@otherness.com").for(:email)
    end

    describe "should be invalid if email is not formatted correctly" do
      it {should_not allow_value("erinpagemd.com").for(:email)}
      it {should_not allow_value("erin@pagecom").for(:email)}
      it {should_not allow_value("@.com").for(:email)}
    end
  end
end
