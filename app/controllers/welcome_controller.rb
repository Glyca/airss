class WelcomeController < ApplicationController

  respond_to :html

  # GET /welcome
  def index
    @articles = Article.order(views: :desc).limit(9)
    respond_with(@articles)
  end

end
