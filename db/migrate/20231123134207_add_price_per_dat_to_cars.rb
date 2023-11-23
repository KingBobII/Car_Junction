class AddPricePerDatToCars < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :price_per_day, :string
  end
end
