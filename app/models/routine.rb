class Routine < ApplicationRecord
  belongs_to :user
  has_many :exercises
  has_many :exercise_sets, through: :exercises

  validates :name, presence: true, uniqueness: true, length: {maximum: 16, too_long: "Name must not exceed ‰{count} characters."}
end
