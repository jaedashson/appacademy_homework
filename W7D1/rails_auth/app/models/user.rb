# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password        :string
#

require 'securerandom'


class User < ApplicationRecord
  include SecureRandom

  before_validation :ensure_session_token
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: 'Password cannot be blank' }
  validates :password, length: { minimum: 6,  allow_nil: true }

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.where(username: username).first

    stored_digest = user.password_digest

    stored_digest_bcrypt = BCrypt::Password.new(stored_digest)
    
    return user if stored_digest_bcrypt.is_password?(password)   
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
  end

  def ensure_session_token
    unless self.session_token
      self.session_token = User.generate_session_token
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
