class User < ApplicationRecord
  has_many :photos

  validates :name, :password, presence: true
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  # Hash password before saving a User
  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  # Generate a token for authentication before creating a User
  before_create :generate_token

  # Generates a token for a user
  def generate_token
    token_gen = SecureRandom.hex
    self.token = token_gen

    token_gen
  end

  # Adds a virtual password field, which we will use when creating a user
  attribute :password, :string

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      return user
    else
      return nil
    end
  end

end
