class RenameReviewToDescriptionInCars < ActiveRecord::Migration[7.1]
  def change
    rename_column :cars, :review, :description
  end
end
