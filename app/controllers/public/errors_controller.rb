class Public::ErrorsController < ApplicationController
  def file_not_found
    respond_to do |format|
      format.html { render status: 404 }
    end
  rescue ActionController::UnknownFormat
    render status: 404, text: "nope"
  end

  def unprocessable
  end

  def internal_server_error
  end
end
