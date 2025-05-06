class GardensController < ApplicationController
  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user

    if @garden.save
      redirect_to gardens_path, notice: 'Garden was successfully created.'
    else
      render :new
    end
  end

  def index
    @gardens = Garden.where(user: current_user)
  end

  def show
    @garden = Garden.find(params[:id])
    @plantations = Plantation.where(garden: @garden)
  end

  def edit
    @garden = Garden.find(params[:id])
  end

  def update
    @garden = Garden.find(params[:id])

    if @garden.update(garden_params)
      redirect_to @garden, notice: 'Garden was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @garden = Garden.find(params[:id])
    @garden.destroy
    redirect_to gardens_path, notice: 'Garden was successfully deleted.', status: :see_other
  end

  private
  def garden_params
    params.require(:garden).permit(:name, :photo)
  end


end
