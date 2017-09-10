class AddSpeciesColumnToCharacters < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :species, :string
  end
end
