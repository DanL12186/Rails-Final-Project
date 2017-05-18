class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.boolean :dislike, default: false
      t.boolean :deceased, default: false
      t.integer :show_id

      t.timestamps
    end
  end
end
