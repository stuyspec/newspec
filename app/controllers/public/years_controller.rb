class Public::YearsController < PublicController
  before_action :set_year, only: [:show]

  # GET /years
  # GET /years.json
  def index
    @years = Year.all
  end

  # GET /years/1
  # GET /years/1.json
  def show
    render_404 if @year.nil?
  end

  private

  def set_year
    @year = get_year
  end

end
