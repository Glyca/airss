class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  respond_to :html

  def show
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
      if @article.views.nil?
        @article.views = 0
      end
      @article.views += 1;
      @article.save
    end

    def article_params
      params.require(:article).permit(:title, :content, :pub_date, :flux, :image_url)
    end
end
