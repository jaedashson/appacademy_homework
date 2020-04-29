class User < ApplicationRecord
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :password_digest, presence: {message: 'can\'t be blank'}
  validates :session_token, :email, presence: true
  after_initialize :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(email, pw)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token 
  end



end