class Public::IssuesController < PublicController
  before_action :set_issue, only: [:show]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Year.include(:issues).find(params[:year_id]).find(params[:id])
    end
end
