class HomeController < ApplicationController
  def index
    @newspaper_hots = Newspaper.ordered_by_newspaper_id.take(4)
  end
end
