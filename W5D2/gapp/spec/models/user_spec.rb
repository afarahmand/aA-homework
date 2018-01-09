require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.create!(username: "ashil", password: "password")
  end

  describe "password encryption" do
    it "does not save passwords to the db" do
      User.create!(username: "joe", password: "password")
      user = User.find_by_username("joe")
      expect(user.password).not_to be("password")
    end

    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "joe", password: "password")
    end
  end

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should have_many(:goals) }
  it { should have_many(:cheers_given) }
  it { should have_many(:cheers_received).through(:goals) }
end
