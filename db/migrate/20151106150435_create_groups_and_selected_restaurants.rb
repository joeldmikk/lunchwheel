class CreateGroupsAndSelectedRestaurants < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end

    create_table :selected_restaurants do |t|
      t.belongs_to :group, index: true
      t.belongs_to :restaurant, index: true

      t.timestamps null: false
    end
  end
end
