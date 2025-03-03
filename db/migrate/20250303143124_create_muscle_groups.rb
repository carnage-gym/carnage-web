class CreateMuscleGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :muscle_groups do |t|
      t.string :name
      t.belongs_to :exercise, null: true, foreign_key: true

      t.timestamps
    end
  end
end
