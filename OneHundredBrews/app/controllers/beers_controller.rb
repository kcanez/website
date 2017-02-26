class BeersController < ApplicationController
	before_action :find_beer, only: [:show, :edit, :update, :destroy]
	
	
	def index
		@beers = Beer.all.order("created_at DESC")
	end
	
	
	def show
		
	end
	
	
	def new
		@beer = Beer.new
	end
	
	def create
		@beer = Beer.new(beer_params)
		
		if @beer.save
			redirect_to root_path
		else
			render 'new'
		end
			
	end
	
	def edit
	end
	
	def update
		if @beer.update(beer_params)
			redirect_to beer_path(@beer)
		else
			render 'edit'
		end
	end
	
	def destroy
		@beer.destroy()
		redirect_to root_path
	end
	
	
	
	private
	
	def beer_params
		params.require(:beer).permit(:name, :description, :brewery, :review, :style, :abv)
	end
	
	def find_beer
		@beer = Beer.find(params[:id])
	end
	
end
