class Admin::MatchesController < AdminController
  before_action :load_round_by_id
  before_action :load_match, except: %i(new create index)
  def index
    @matches = @round.matches.page(params[:page]).per Settings.paging_table
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new match_params
    if @match.save

      flash[:success] = t("success")
      redirect_to admin_round_matches_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    # update_rank_update
    if @match.update match_params
      flash[:success] =  t "success"
      redirect_to admin_round_matches_path
    else
      render :edit
    end
  end

  def destroy
    if @match.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "error"
    end
    redirect_to admin_round_matches_path
  end

  private

  def match_params
    params.require(:match).permit Match::MATCH_PARAMS
  end

  def load_match
    @match = Match.find_by id: params[:id]
    return if @match
    flash[:danger] = t "error"
    redirect_to root_path
  end

  def load_round_by_id
    @round = Round.find_by id: params[:round_id]
  end

  # def update_rank_update
  #   rank_home = Ranking.find_by season_id: @match.round.season.id, football_club_id: @match.home_team.id
  #   rank_guest = Ranking.find_by season_id: @match.round.season.id, football_club_id: @match.guest_team.id
  #   goal_of_old_match_home = @match.goals_home_team.to_i
  #   goal_of_new_match_home = params[:match][:goals_home_team].to_i
  #   goal_of_old_match_guest = @match.goals_guest_team.to_i
  #   goal_of_new_match_guest = params[:match][:goals_guest_team].to_i
  #   rank_home.update_attributes goals_number: rank_home.goals_number - goal_of_old_match_home + goal_of_new_match_home,
  #     goals_lost_number: rank_home.goals_lost_number - goal_of_old_match_guest + goal_of_new_match_guest
  #   rank_guest.update_attributes goals_number: rank_guest.goals_number - goal_of_old_match_guest + goal_of_new_match_guest,
  #     goals_lost_number: rank_guest.goals_lost_number - goal_of_old_match_home + goal_of_new_match_home
    
  # end
end
