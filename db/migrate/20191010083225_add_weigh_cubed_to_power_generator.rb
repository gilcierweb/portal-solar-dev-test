class AddWeighCubedToPowerGenerator < ActiveRecord::Migration[5.2]
  def change
    add_column :power_generators, :weigh_cubed, :decimal
  end
end
