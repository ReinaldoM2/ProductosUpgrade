class BrandsController < ApplicationController
  def index
  brand = Brand.all()
  brands_parsed = brand.map do |item| {
  		name: item.name,
  		description: item.description,
  		contact: item.contact,
  		image:  item.brand_image.attached? ? url_for(item.brand_image) : false,
  		id: item.id
  	}
	end
  render json: brands_parsed
 end

 def create
 	brand = Brand.new(brand_params)
 	brand.save
 	render json: brand
 end

 def show
	brand = Brand.find(params[:id])
	render json: {
		name: brand.name,
		description: brand.description,
		contact: brand.contact,
		id: brand.id,
		image: brand.brand_image.attached? ? url_for(brand.brand_image) : false
	}
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
 	params.permit(:name,:description,:contact,:brand_image)
 end

end