module Admin::MatchesHelper
	def get_football_clubs round
    Season.find_by(id: round.season.id).football_clubs.collect{ |m| [m.name, m.id] }
  end

  def get_league
    Round.pluck :name, :id
  end 
end
