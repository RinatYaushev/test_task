class PostsController < ApplicationController
  before_action :set_slider

  before_action :set_post, only: [:show, :edit, :update, :destroy]

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

  def set_post
    @post = @slider.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :author, :content).merge(slider: @slider)
  end
end
