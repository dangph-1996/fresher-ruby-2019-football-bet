class HomeController < ApplicationController
  include HomeHelper
  def index
    @newspaper_hots = Newspaper.ordered_by_newspaper_id.by_status_hot.take(4)
    @newspaper_normals = Newspaper.by_status_normal.take(4)
    @categories_show = Category.by_status_show.take 4
    @newspapers_show = get_new_of_category @categories_show.map &:id
  end 
end
