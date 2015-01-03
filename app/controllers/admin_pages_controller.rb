class AdminPagesController < ApplicationController
  def index
    redirect_to unless user_signed_in?
  end
end
