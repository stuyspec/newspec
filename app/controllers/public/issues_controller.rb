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
      @issue = Year.includes(:issues).find_by(:year => params[:year_id]).issues.find_by(:number => params[:issue_id])
    end
end
