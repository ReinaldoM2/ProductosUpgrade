class ProductsController < ApplicationController
  before_action :get_brand
  def index
  product = @brand.products
  render json: product
 end

 def create
 	product = Product.new(product_params)
 	product.save
 	render json: product
 end

 def show
	product = Product.find(params[:id])
	render json: product
end

def update
	begin
		product = Product.find(params[:id]) 
		product.update(product_params)
		product.save!
		render json: product
	rescue Exception => e
		raise
	end

end

def destroy
	product = Product.find(params[:id])
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
 	params.require(:product).permit(:name, :price, :quantity,:brand_id)
 end

end
