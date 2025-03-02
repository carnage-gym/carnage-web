class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  has_many :exercises, dependent: :destroy
  has_many :routines, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :biography, length: {maximum: 60}, allow_blank: true
  validates :password, confirmation: {case_sensitive: true}
  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
