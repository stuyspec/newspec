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
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year
      @year = Year.find_by(year: params[:year])
    end

end
