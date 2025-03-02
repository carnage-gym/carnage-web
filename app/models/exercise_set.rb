class ExerciseSet < ApplicationRecord
  validates_presence_of :weight, :reps  # rir can be blank, for stuff like warmup sets
  validates :weight, :reps, :rir, numericality: {greater_than: 0}
  validates_numericality_of :rir, {in: (0..10)}
end
