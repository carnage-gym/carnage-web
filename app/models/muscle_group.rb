class MuscleGroup < ApplicationRecord
  belongs_to :exercise, optional: true
end
