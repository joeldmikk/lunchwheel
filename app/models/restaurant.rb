class Restaurant < ActiveRecord::Base

  has_many :selected_restaurants
  has_many :groups, :through => :selected_restaurants

  def self.find_by_name(name)
    GooglePlaces.find_restaurant_by_name(name)
  end

end
