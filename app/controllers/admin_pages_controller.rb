class AdminPagesController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def articles
  end

  def users
  end
end
