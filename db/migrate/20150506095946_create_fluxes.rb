class CreateFluxes < ActiveRecord::Migration
  def change
    create_table :fluxes do |t|
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
