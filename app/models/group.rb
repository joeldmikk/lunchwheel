class Group < ActiveRecord::Base
  has_many :users
  has_many :selected_restaurants
  has_many :restaurants, :through => :selected_restaurants
end
