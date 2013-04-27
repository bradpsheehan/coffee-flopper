class AddLatitudeAndLongitudeToAddress < ActiveRecord::Migration
  def change
    remove_column :addresses, :lat
    remove_column :addresses, :long
    add_column :addresses, :latitude, :float
    add_column :addresses, :longitude, :float
  end
end
