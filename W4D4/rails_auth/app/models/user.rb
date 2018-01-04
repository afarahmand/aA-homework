class User < ApplicationRecord
  before_validation :ensure_session_token
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: { message: 'Password can\'t be blank'}, length: {minimum: 6, allow_nil: true}
  validates :session_token, presence: true

  attr_reader :password

  def self.find_by_credentials(username, pw)
    user = User.find_by(username: username)
    if user && BCrypt::Password.new(user.password_digest).is_password?(pw)
      return @user
    else
      return nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(12)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end
end
