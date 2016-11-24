class PostsController < ApplicationController
  before_action :set_slider

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to slider_path(@slider)
    else
      redirect_to root_path
    end
  end

  private

  def set_slider
    @slider = Slider.find(params[:slider_id])
  end

  def post_params
    params.require(:post).permit(:name, :author, :content).merge(slider: @slider)
  end
end
