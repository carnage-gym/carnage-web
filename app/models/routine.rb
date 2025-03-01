class Routine < ApplicationRecord
  belongs_to :user
  has_many :exercises
  has_many :exercise_sets, through: :exercises

  validates_presence_of :name
end
