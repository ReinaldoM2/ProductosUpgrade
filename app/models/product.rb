require 'open-uri' 
class Product < ApplicationRecord
  belongs_to :brand 
  has_one_attached :product_image  ,dependent: :destroy
  def self.import_from_file(file)
    spreadsheet = Roo::Spreadsheet.open file
      header = spreadsheet.row 1
      (2..spreadsheet.last_row).each do |i|
        row = [header, spreadsheet.row(i)].transpose.to_h
        product = Product.new
        product.name = row["name"]
        product.price = row["price"]
        product.quantity = row["quantity"]
        product.save!
        rege= /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)/
        if row["image"] && rege.match(row["image"])
          open(row["image"]) do |file|
            product.product_image.attach(io: file, filename: 'jeje.jpg',  content_type: file.meta["content-type"])
          end
        end
    end
  end
end
