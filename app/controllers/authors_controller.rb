class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.where(slug: params[:slug]).take!
  end
end
