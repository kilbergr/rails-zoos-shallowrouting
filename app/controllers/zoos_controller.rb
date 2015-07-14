class ZoosController < ApplicationController

	before_action :find_zoo, only: [:show, :edit, :update, :destroy]

  def index
  	@zoos = Zoo.all
  end

  def new
  	@zoo = Zoo.new
  end

  def create
  	@zoo = Zoo.new(zoo_params)
  	if @zoo.save
  		redirect_to zoos_path, flash: {success: "Successfully Added Zoo"}
  	else
  		render :new
  	end

  end

  def show
  end

  def edit
  end

  def update
  	if @zoo.update zoo_params
  		redirect_to zoo_path(@zoo), notice: "Zoo Information Updated"
  	else
  		render :edit
  	end
  end

  def destroy
 		@zoo.destroy
  	redirect_to zoos_path, alert: "Zoo Deleted"
  end


  private
  def zoo_params
  	params.require(:zoo).permit(:name, :location)
  end

  def find_zoo
  	@zoo = Zoo.find_by_id params[:id]
  end
end
