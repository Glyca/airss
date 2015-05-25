class AddFetchedAtToFluxes < ActiveRecord::Migration
  def change
    add_column :fluxes, :fetched_at, :datetime
  end
end
