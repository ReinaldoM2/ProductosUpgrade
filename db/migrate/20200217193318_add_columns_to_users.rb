class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :UID, :string
    add_column :users, :image, :text
  end
end
