class AddUserToFluxes < ActiveRecord::Migration
  def change
    add_reference :fluxes, :user, index: true
  end
end
