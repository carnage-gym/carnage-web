class CreateRoutines < ActiveRecord::Migration[8.0]
  def change
    create_table :routines do |t|
      t.string :name

      t.timestamps
    end
  end
end
