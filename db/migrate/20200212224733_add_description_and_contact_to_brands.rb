class AddDescriptionAndContactToBrands < ActiveRecord::Migration[6.0]
  def change
    add_column :brands, :description, :text
    add_column :brands, :contact, :string
  end
end
