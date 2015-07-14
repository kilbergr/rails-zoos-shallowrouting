class AnimalsController < ApplicationController

	before_action :find_zoo, only: [:index, :new, :create]
	before_action :find_animal, only: [:show, :edit, :update, :destroy]

  def index
  	#@zoo = Zoo.find_by_id params[:zoo_id]
  end

  def new
  	#@zoo = Zoo.find_by_id params[:zoo_id]
  	@animal = Animal.new
  end

  def create
  	#@zoo = Zoo.find_by_id params[:zoo_id]
  	@animal = @zoo.animals.new(animal_params)
		if @animal.save
			flash[:success] = "Animal Added!"
			redirect_to zoo_animals_path(@zoo)
		else 
			render :new
		end
  end

  def show
  	#	@animal = Animal.find_by_id params[:id]
  end

  def edit
  	#	@animal = Animal.find_by_id params[:id]
  end

  def update
  	#	@animal = Animal.find_by_id params[:id]
  	if @animal.update animal_params
  		redirect_to animal_path(@animal)
  	else
  		render :edit
  	end
  end

  def destroy
  	#	@animal = Animal.find_by_id params[:id]
  	if @animal.destroy 
  	#@zoo = Zoo.find_by_id params[:zoo_id]
  		redirect_to zoo_animals_path(@animal.zoo)
  	else
  		render :show
  	end

  end

  private
  	def animal_params
  		params.require(:animal).permit(:name, :age, :species)
  	end

  	def find_animal
  		@animal = Animal.find_by_id params[:id]
  	end

  	def find_zoo
  		@zoo = Zoo.find_by_id params[:zoo_id]
  	end
end
