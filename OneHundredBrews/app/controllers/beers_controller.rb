class BeersController < ApplicationController
	before_action :find_beer, only: [:show, :edit, :update, :destroy]
	
	
	def index
		if params[:category].blank?
			@beers = Beer.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@beers = Beer.where(:category_id => @category_id).order("created_at DESC")
		end
	end
	
	
	def show
		
	end
	
	
	def new
		@beer = current_user.beers.build
		@categories = Category.all.map{ |c| [c.name, c.id] }		
	end
	
	def create
		@beer = current_user.beers.build(beer_params)
		@beer.category_id = params[:category_id]
		
		if @beer.save
			redirect_to root_path
		else
			render 'new'
		end
			
	end
	
	def edit
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end
	
	def update
		@beer.category_id = params[:category_id]
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
		params.require(:beer).permit(:name, :description, :brewery, :review, :style, :abv, :category_id)
	end
	
	def find_beer
		@beer = Beer.find(params[:id])
	end
	
end
