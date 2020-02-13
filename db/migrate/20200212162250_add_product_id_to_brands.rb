class AddProductIdToBrands < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :brand, index: true
    add_foreign_key :products, :brands
  end
end
