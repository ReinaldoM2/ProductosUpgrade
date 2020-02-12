class ProductsController < ApplicationController
  def index
  product = Product.all()
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
	product = Product.find(params[:id]) 
	product.update(product_params)
	render json: product
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

 def product_params
 	params.require(:product).permit(:name, :brand, :price, :quantity)
 end

end
