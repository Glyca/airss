class AddArticleToFluxes < ActiveRecord::Migration
  def change
    add_reference :articles, :flux, index: true
  end
end
