class AddProductIdToBrands < ActiveRecord::Migration[6.0]
  def change
    add_reference :brands, :product, index: true
    add_foreign_key :brands, :products
  end
end
