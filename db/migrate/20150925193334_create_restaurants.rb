class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :price
      t.integer :distance
      t.integer :rating
      t.date :last_visited

      t.timestamps null: false
    end
  end
end
