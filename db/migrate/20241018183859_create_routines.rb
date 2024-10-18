class CreateRoutines < ActiveRecord::Migration[7.2]
  def change
    create_table :routines do |t|
      t.string :name
      t.string :description
      t.references :user

      t.timestamps
    end
  end
end
