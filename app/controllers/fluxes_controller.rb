class FluxesController < ApplicationController
  before_filter :check_user
  before_action :set_flux, :authenticate_user!, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @fluxes = Flux.all
    respond_with(@fluxes)
  end

  def show
    respond_with(@flux)
  end

  def new
    @flux = Flux.new
    respond_with(@flux)
  end

  def edit
  end

  def create
    @flux = Flux.new(flux_params)
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
    end

    def check_user
        redirect_to url_for :controller => 'devise/sessions', :action => 'new' and return unless user_signed_in?
    end

    def flux_params
      params.require(:flux).permit(:url, :title)
    end
end
