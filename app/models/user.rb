class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  validates_presence_of :username

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
