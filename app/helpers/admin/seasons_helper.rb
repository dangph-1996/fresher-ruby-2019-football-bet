module Admin::SeasonsHelper
  def get_league
    League.pluck :name, :id
  end 
end
