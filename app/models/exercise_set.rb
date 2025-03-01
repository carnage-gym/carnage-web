class ExerciseSet < ApplicationRecord
  validates_presence_of :weight, :reps, :rir
  validates_numericality_of :weight, {greater_than: 0}
  validates_numericality_of :reps, {greater_than: 0}
  validates_numericality_of :rir, {in: (0..10)}
end
