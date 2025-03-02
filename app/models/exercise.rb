class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :routine, optional: true

  validates :name, presence: true, uniqueness: true, length: {maximum: 32, too_long: "name must not exceed %{count} characters."}
  validates :description, allow_blank: true, length: {maximum: 120}
end
