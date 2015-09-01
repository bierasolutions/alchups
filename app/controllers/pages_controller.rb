class PagesController < ApplicationController
  layout "public"
  def index
    @tanks = Tank.all
    @routes = Route.all
  end

  def alchup
    @tank = Tank.find(params[:id])
  end

  def route
    @route = Route.find(params[:id])
  end

  def town
  end

  def what
  end
end
