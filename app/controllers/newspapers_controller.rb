class NewspapersController < ApplicationController
  before_action :load_newspaper, except: %i(new create index search)

  def index; end

  def show
    @newspaper_new = Newspaper.take Settings.paging_table
  end

  def search
    @newspapers = Newspaper.ransack(params[:q]).result.page(params[:page])
      .per Settings.paging_table
  end

  private

  def newspaper_params
    params.require(:newspaper).permit Newspaper::NEWSPAPER_PARAMS
  end

  def load_newspaper
    @newspaper = Newspaper.find_by id: params[:id]

    return if @newspaper
    flash[:danger] = t "error"
    redirect_to root_path
 end
end
