class PagesController < ApplicationController
  layout "public"
  def index
    @tanks = Tank.all
  end
end
