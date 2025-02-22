class AddBiographyToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :biography, :string
  end
end
