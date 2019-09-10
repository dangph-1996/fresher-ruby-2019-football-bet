class MatchsController < ApplicationController
  before_action :load_match, except: %i(new create index)

  def index
    @leagues = League.all
    @league = League.find_by id: params[:league]
    if @league
      @seasons = @league.seasons
      @season = Season.find_by id: params[:season]
      if @season
        @rounds = @season.rounds
        @round = Round.find_by id: params[:round]
        @matches = @round.matches if @round
      end
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @bet = Bet.new
  end

  private

  def load_match
    @match = Match.find_by id: params[:id]
    return if @match
    flash[:danger] = t "error"
    redirect_to root_path
  end
end
