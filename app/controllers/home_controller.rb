class HomeController < ApplicationController
  def index
    @communities = Community.all.limit(5)
  end
end
