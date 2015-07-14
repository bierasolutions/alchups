class TanksController < ApplicationController
  def new
    @tank = Tank.new
  end

  def create
    @tank = Tank.new(tank_params)
    if @tank.save
      redirect_to @tank
    else
      render 'new'
    end
  end

  def show
    @tank = Tank.find(params[:id])
  end

  def index
    @tanks = Tank.all
  end

  def edit
    @tank = Tank.find(params[:id])
  end

  def update
    @tank = Tank.find(params[:id])
    if @tank.update_attributes(tank_params)
      redirect_to @tank
    else
      render 'edit'
    end
  end

  def destroy
    Tank.find(params[:id]).destroy
    redirect_to tanks_url
  end

  private
    def tank_params
      params.require(:tank).permit(:title, :description, :latitude,:longitude, :notes)
    end
end
