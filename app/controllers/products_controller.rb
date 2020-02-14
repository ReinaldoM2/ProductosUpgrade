class ProductsController < ApplicationController
  before_action :get_brand
  def index
  	product = @brand.products
  	products_parsed = product.map do |item| {
  		name: item.name,
  		price: item.price,
  		quantity: item.quantity,
  		image:  item.product_image.attached? ? url_for(item.product_image) : false,
  		id: item.id
  	}
	end
  render json: products_parsed
 end

 def create
 	product = @brand.product.new(product_params)
 	product.save
 	render json: product
 end

 def show
	product = @brand.products.find(params[:id])
	render json: product
end

def update
	begin
		product = @brand.products.find(params[:id]) 
		product.update(product_params)
		product.save!
		render json: product
	rescue Exception => e
		raise
	end

end

def destroy
	product = @brand.products.find(params[:id])
	product.destroy
	render json: product
end

def import
end

 def import_from_file
   Product.import_from_file(params[:file])
   render json: { created: true }, status: :created
   #redirect_to root_url, notice: "Datos Importados"
 end

 private

 def get_brand
 	@brand = Brand.find(params[:brand_id])
 end

 def product_params
 	params.permit(:name, :price, :quantity,:brand_id,:product_image)
 end

end
