class SlidesController < ApplicationController
  before_action :set_slide, only: [:show, :edit, :update, :destroy]

  before_action :set_slide_slider

  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.new(slide_params)

    if @slide.save
      redirect_to slider_slide_path(@slide_slider, @slide)
    else
      redirect_to root_path
    end
  end

  def update
    if @slide.update(slide_params)
      redirect_to slider_slide_path(@slide_slider, @slide)
    else
      redirect_to root_path
    end
  end

  def destroy
    @slide.destroy
    redirect_to root_path
  end

  private

  def set_slide_slider
    @slide_slider = Slider.find(params[:slider_id])
  end

  def set_slide
    @slide = Slide.find(params[:id])
  end

  def slide_params
    params.require(:slide)
          .permit(:image)
          .merge(slider_id: @slide_slider.id)
  end
end
