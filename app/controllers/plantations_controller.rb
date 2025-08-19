# Plantations Controller - Handles planting and removing plants in gardens
# Nested under gardens controller, manages the many-to-many relationship between gardens and plants
class PlantationsController < ApplicationController
  # Ensure we have the garden context for all plantation operations
  before_action :set_garden

  # GET /gardens/:garden_id/plantations/new - Display form for adding a plant to garden
  def new
    # Build new plantation associated with the current garden
    @plantation = @garden.plantations.new
    # Get all available plants for selection in the form
    @plants = Plant.all
  end

  # POST /gardens/:garden_id/plantations - Add a plant to the garden with planting date
  def create
    # Create plantation associated with the current garden
    @plantation = @garden.plantations.new(plantation_params)

    if @plantation.save
      # Redirect back to garden show page with success message
      redirect_to @garden, notice: 'Plant was successfully added to garden.'
    else
      # Re-render form with validation errors, reload plants for dropdown
      @plants = Plant.all
      render :new
    end
  end

  # DELETE /gardens/:garden_id/plantations/:id - Remove a plant from the garden
  def destroy
    # Find the specific plantation to remove from this garden
    @plantation = @garden.plantations.find(params[:id])
    @plantation.destroy
    # Redirect back to garden show page with success message
    redirect_to @garden, notice: 'Plant was successfully removed from garden.'
  end

  private

  # Callback to set the garden context from URL parameters
  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  # Strong parameters - only allow safe attributes for plantation creation
  def plantation_params
    params.require(:plantation).permit(:plant_id, :date)
  end
end
