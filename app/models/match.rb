class Match < ApplicationRecord
  after_save :update_ranking, if: :game_finish?
  MATCH_PARAMS = %i(home_team_id guest_team_id start_time finish_time goals_home_team goals_guest_team round_id status).freeze
  enum status: {unfought: 0, fighting: 1, fought: 2}

  belongs_to :round
  belongs_to :home_team, class_name: FootballClub.name
  belongs_to :guest_team, class_name: FootballClub.name

  delegate :round_number, to: :round, prefix: true

  def game_finish?
    self.fought?
  end

  def update_ranking
    rank_home = Ranking.find_by season_id: self.round.season.id, football_club_id: self.home_team.id
    rank_guest = Ranking.find_by season_id: self.round.season.id, football_club_id: self.guest_team.id
    rank_home.update_attributes goals_number: rank_home.goals_number + self.goals_home_team, goals_lost_number: rank_home.goals_lost_number + self.goals_guest_team
    rank_guest.update_attributes goals_number: rank_guest.goals_number + self.goals_guest_team, goals_lost_number: rank_guest.goals_lost_number + self.goals_home_team
    if goals_home_team > goals_guest_team
      rank_home.update_attributes games_win: rank_home.games_win + 1
      rank_guest.update_attributes games_lost: rank_guest.games_lost + 1
    elsif goals_guest_team == goals_home_team
      rank_home.update_attributes games_draw: rank_home.games_draw + 1
      rank_guest.update_attributes games_draw: rank_guest.games_draw + 1
    else
      rank_home.update_attributes games_lost: rank_home.games_lost + 1
      rank_guest.update_attributes games_win: rank_guest.games_win + 1
    end 
  end
end
