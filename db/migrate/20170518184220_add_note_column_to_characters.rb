class AddNoteColumnToCharacters < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :note, :text, timestamps: true
  end
end
