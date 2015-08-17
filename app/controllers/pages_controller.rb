class PagesController < ApplicationController
  layout "public"
  def index
    @tanks = Tank.all
    @routes = Route.all
  end
end
