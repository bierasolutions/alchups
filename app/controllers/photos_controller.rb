class PhotosController < ApplicationController
  def new
    tank = Tank.find(params[:tank_id])
    @photo = Photo.new(tank: tank)
  end

  def create
    tank = Tank.find(params[:tank_id])
    tank.photos.create(photo_params)
    redirect_to tank_path(tank)
  end

  def destroy
    tank = Tank.find(params[:tank_id])
    tank.photos.find(params[:id]).destroy
    redirect_to tank_path(tank)
  end

  private 
    def photo_params
      params.require(:photo).permit(:image)
    end
end
