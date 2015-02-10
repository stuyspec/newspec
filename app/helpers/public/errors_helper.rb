module Public::ErrorsHelper
  def render_404
    render 'public/errors/file_not_found'
  end

  def redirect_404
    redirect_to 'public/errors/file_not_found'
  end
end
