# app/controllers/plantations_controller.rb
class PlantationsController < ApplicationController
  before_action :set_garden

  def new
    @plantation = @garden.plantations.new
    @plants = Plant.all
  end

  def create
    @plantation = @garden.plantations.new(plantation_params)

    if @plantation.save
      redirect_to @garden, notice: 'Plant was successfully added to garden.'
    else
      @plants = Plant.all
      render :new
    end
  end

  def destroy
    @plantation = @garden.plantations.find(params[:id])
    @plantation.destroy
    redirect_to @garden, notice: 'Plant was successfully removed from garden.'
  end

  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def plantation_params
    params.require(:plantation).permit(:plant_id, :date)
  end
end
