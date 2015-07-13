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
    
  end

  def index
    @tanks = Tank.all
  end

  private
    def tank_params
      params.require(:tank).permit(:title, :description, :latitude,:longitude, :notes)
    end
end
