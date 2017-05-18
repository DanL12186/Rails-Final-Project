class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.boolean :like
      t.boolean :alive
      t.integer :show_id

      t.timestamps
    end
  end
end
