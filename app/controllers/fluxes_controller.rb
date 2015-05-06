class FluxesController < ApplicationController
  before_action :set_flux, only: [:show, :edit, :update, :destroy]

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

    def flux_params
      params.require(:flux).permit(:url, :title)
    end
end
