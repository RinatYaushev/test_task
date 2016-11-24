class SlidersController < ApplicationController
  before_action :set_slider, only: [:show, :edit, :update, :destroy]

  def new
    @slider = Slider.new
  end

  def create
    @slider = Slider.new(slider_params)

    if @slider.save
      redirect_to slider_path(@slider)
    else
      redirect_to root_path
    end
  end

  def update
    if @slider.update(slider_params)
      redirect_to slider_path(@slider)
    else
      redirect_to root_path
    end
  end

  def destroy
    @slider.destroy
    redirect_to root_path
  end

  private

  def set_slider
    @slider = Slider.find(params[:id])
  end

  def slider_params
    params.require(:slider).permit(:name)
  end
end
