class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  has_many :exercises, dependent: :destroy
  has_many :routines, dependent: :destroy

  validates_presence_of :username, :password
  validates :username, uniqueness: true, length: {maximum: 16, too_long: "username must not exceed %{count} characters."}
  validates :biography, length: {maximum: 60}, allow_blank: true
  validates :password, confirmation: {case_sensitive: true}
  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
