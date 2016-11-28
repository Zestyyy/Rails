class User < ActiveRecord::Base
  has_secure_password
  has_many :organizations
  has_many :joins, dependent: :destroy
  has_many :organizations_joined, through: :joins, source: :organizations

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  before_save do
        self.email.downcase!
    end
end
