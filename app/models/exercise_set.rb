class ExerciseSet < ApplicationRecord
    belongs_to :exercise
    belongs_to :workout

    validates :weight, :reps, :intensity, presence: true

    validates :weight, numericality: true
    validates :reps, numericality: { only_integer: true }
    validates :intensity, numericality: { in: 1..10 }

    validates :weight, :reps, numericality: { greater_than_or_equal_to: 0 }

end
