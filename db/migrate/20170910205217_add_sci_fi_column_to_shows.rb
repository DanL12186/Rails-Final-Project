class AddSciFiColumnToShows < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :sci_fi, :boolean, default: false
  end
end
