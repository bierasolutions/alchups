class PagesController < ApplicationController
  layout "public"
  def index
    @tanks = Tank.all
    @routes = Route.all
  end

  def alchup
    @tank = Tank.find(params[:id])
  end
end
