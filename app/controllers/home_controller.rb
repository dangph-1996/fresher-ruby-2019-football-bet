class HomeController < ApplicationController
  def index
    @newspaper_hots = Newspaper.ordered_by_newspaper_id.take(Settings.show_newspaper_home)
    @newspaper_normals = Newspaper.by_status_normal.take(Settings.show_newspaper_home)
  end
end
