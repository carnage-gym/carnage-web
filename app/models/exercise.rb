class Exercise < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :routines
  has_and_belongs_to_many :muscle_groups
  has_many :exercise_sets

  validates :name, presence: true, uniqueness: true, length: {maximum: 32, too_long: "name must not exceed %{count} characters."}
  validates :description, allow_blank: true, length: {maximum: 120}
end
