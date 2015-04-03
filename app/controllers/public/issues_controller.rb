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
    render_404 if @issue.nil?
  end

  private

  def set_issue
    @issue = get_issue params[:issue], params[:year]
  end

end
