class GooglfyRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :latitude, :string
    add_column :restaurants, :longitude, :string
    add_column :restaurants, :place_id, :string
    add_column :restaurants, :reference, :string
    add_column :restaurants, :types, :string
    add_column :restaurants, :vicinity, :string
  end
end
