class PagesController < ApplicationController
  layout "public"
  def index
    @tanks = Tank.all.order(:title)
    @routes = Route.all
  end

  def alchup
    @tank = Tank.find(params[:id])
    @other = Tank.limit(3).order("RANDOM()")
  end

  def route
    @route = Route.find(params[:id])
  end

  def town
  end

  def what
  end

  def cookies
  end
end
