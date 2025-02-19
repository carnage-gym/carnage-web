class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  validates_presence_of :username
  validates :password, confirmation: { case_sensitive: true }

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
