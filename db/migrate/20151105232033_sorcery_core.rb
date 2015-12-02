class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.references :group

      t.timestamps
    end

    add_index :users, :email, unique: true

    create_table :authentications do |t|
      t.string :uid
      t.string :provider
      t.belongs_to :user, index: true

      t.timestamps
    end

    add_index :authentications, [:provider, :uid]
  end
end