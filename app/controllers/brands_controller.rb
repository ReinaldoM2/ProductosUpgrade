class BrandsController < ApplicationController
  def index
  brand = Brand.all()
  render json: brand
 end

 def create
 	brand = Brand.new(brand_params)
 	brand.save
 	render json: brand
 end

 def show
	brand = Brand.find(params[:id])
	render json: brand
end

def update
	brand = Brand.find(params[:id]) 
	brand.update(brand_params)
	render json: brand
end

def destroy
	brand = Brand.find(params[:id])
	brand.destroy
	render json: brand
end

def import
end

 def import_from_file
   Brand.import_from_file(params[:file])
   render json: { created: true }, status: :created
 end

 private

 def brand_params
 	params.require(:brand).permit(:name)
 end

end