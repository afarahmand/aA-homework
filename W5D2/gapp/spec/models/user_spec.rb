require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_uniqueness_of(:session_token)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_length_of(:password).is_at_least(6)}
  end

  # Associations
  describe 'associations' do
    it { should have_many(:comments)}
    it { should have_many(:goals)}
  end

  describe 'password encryption' do
    it 'does not save passwords to the database' do
      User.create!(username: 'jack_bruce', password: 'abcdef')
      user = User.find_by_username('jack_bruce')
      expect(user.password).not_to be('abcdef')
    end

    it 'encrypts the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: 'jack_bruce', password: 'abcdef')
    end
  end

  describe 'session token' do
    it 'assigns a session_token if one is not given' do
      jack = User.create(username: 'jack_bruce', password: 'abcdef')
      expect(jack.session_token).not_to be_nil
    end
  end
end


# jknLKnlkns
