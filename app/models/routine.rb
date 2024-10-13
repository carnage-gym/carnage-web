class Routine < ApplicationRecord
  has_many :exercise_sets
  has_many :exercises, through: :exercise_sets
  belongs_to :user

  accepts_nested_attributes_for :exercise_sets
end
