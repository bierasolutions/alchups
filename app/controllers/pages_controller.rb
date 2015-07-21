class PagesController < ApplicationController
  def index
    @tanks = Tank.all
  end
end
