class AddOmniIdColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :omni_id, :integer
  end
end
