require 'open-uri'

class FluxesController < ApplicationController
  before_filter :check_user
  before_action :set_flux, :authenticate_user!, only: [:show, :update, :destroy]

  respond_to :html

  def index
    @fluxes = Flux.where(:user => current_user).paginate(:page => params[:page], :per_page => 5)
    @articles = Article.order(pub_date: :desc).limit(9)
    respond_with(@fluxes, @articles)
  end

  def show
    respond_with(@flux)
  end

  def new
    @flux = Flux.new
    respond_with(@flux)
  end

  def create
    @flux = Flux.new(flux_params)
    rss = SimpleRSS.parse open(@flux.url)
    @flux.title = rss.channel.title
    @flux.user = current_user
    @flux.save
    respond_with(@flux)
  end

  def update
    @flux.update(flux_params)
    respond_with(@flux)
  end

  def destroy
    @flux.destroy
    respond_with(@flux)
  end

  private
    def set_flux
      @flux = Flux.find(params[:id])

      if(@flux.user != current_user)
        return
      end

      if @flux == nil
        return
      end

      if @flux.fetched_at == nil || @flux.fetched_at < (Time.new - 60*15)
        # Suppression de tous les articles
        @flux.articles.delete_all

        # On recharge la liste des flux depuis le site
        SimpleRSS.item_tags << :'enclosure#url'
        rss = SimpleRSS.parse open(@flux.url)
        coder = HTMLEntities.new
        rss.items.each {|article|
          title = article.title.force_encoding('UTF-8')
          description = coder.decode(article.description.force_encoding('UTF-8'))
          @flux.articles.create(title: title, content: description, url: article.link, pub_date: article.pubDate, image_url: article.enclosure_url, views: 0)
          }

        @flux.fetched_at = Time.new
        @flux.save
      end
    end

    def check_user
        redirect_to url_for :controller => 'devise/sessions', :action => 'new' and return unless user_signed_in?
    end

    def flux_params
      params.require(:flux).permit(:url)
    end
end

#:title
