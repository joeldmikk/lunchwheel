class AddLocationToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :location, :string
    add_column :groups, :zip_code, :integer
  end
end
