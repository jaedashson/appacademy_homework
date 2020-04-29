require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) } # Do we need .on(:create) ?

  subject(:user) { User.new(email: "dumb@stupid.com", password: "hunter12") }

  describe "#is_password?" do 
    it "should return boolean indicating whether given password belongs to user" do 
      expect(user.is_password?("hunter12").to be(true)) # undefined method 'to' for true:TrueClass
    end
  end

  describe "#reset_session_token" do 
    it "should generate new session token for user and assign it to session params" do
      old_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_token)
    end
  end
    

  describe "::find_by_credentials" do
    it "should return user given that user's email and password" do
      found_user = User.find_by_credentials("dumb@stupid.com", "hunter12")

      expect(found_user.email).to eq("dumb@stupid.com")
      expect(found_user.is_password?("hunter12")).to be(true)
    end
  end
end
