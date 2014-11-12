class BackgroundsController < ApplicationController
  def index
    @backgrounds = Background.all
  end

  def show
    @background = Background.find(params[:id])
  end

  def new
    @background = Background.new
  end

  def create
    @background = Background.new(photo_params)
    if @background.save
      redirect_to @background
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:background).permit(:title, :image)
  end
end
