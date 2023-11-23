class RemoveImageColumnFromCars < ActiveRecord::Migration[7.1]
  def change
    remove_column :cars, :image
  end
end
