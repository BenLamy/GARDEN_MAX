# Gardens Controller - Handles CRUD operations for user gardens
# Manages garden creation, viewing, editing and deletion with user ownership
class GardensController < ApplicationController
  
  # GET /gardens/new - Display form for creating a new garden
  def new
    @garden = Garden.new
  end

  # POST /gardens - Create a new garden for the current user
  def create
    @garden = Garden.new(garden_params)
    # Associate the garden with the currently logged-in user
    @garden.user = current_user
    
    if @garden.save
      redirect_to gardens_path, notice: 'Garden was successfully created.'
    else
      # Re-render the form with validation errors
      render :new
    end
  end

  # GET /gardens - Display all gardens belonging to the current user
  def index
    @gardens = Garden.where(user: current_user)
  end

  # GET /gardens/:id - Display a specific garden with its plantations
  def show
    @garden = Garden.find(params[:id])
    # Get all plantations for this garden to display planted items
    @plantations = Plantation.where(garden: @garden)

    # Initialize variables needed for the plantation creation modal
    @plantation = Plantation.new
    @plants = Plant.all # All available plants for selection
  end

  # GET /gardens/:id/edit - Display form for editing an existing garden
  def edit
    @garden = Garden.find(params[:id])
  end

  # PATCH/PUT /gardens/:id - Update an existing garden
  def update
    @garden = Garden.find(params[:id])
    
    if @garden.update(garden_params)
      redirect_to @garden, notice: 'Garden was successfully updated.'
    else
      # Re-render the form with validation errors
      render :edit
    end
  end

  # DELETE /gardens/:id - Remove a garden and all its plantations
  def destroy
    @garden = Garden.find(params[:id])
    @garden.destroy # This will also destroy associated plantations due to dependent: :destroy
    redirect_to gardens_path, notice: 'Garden was successfully deleted.', status: :see_other
  end

  private

  # Strong parameters - only allow safe attributes for garden creation/updates
  def garden_params
    params.require(:garden).permit(:name, :photo)
  end
end
