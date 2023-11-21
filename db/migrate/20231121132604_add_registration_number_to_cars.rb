class AddRegistrationNumberToCars < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :registration_number, :string
  end
end
