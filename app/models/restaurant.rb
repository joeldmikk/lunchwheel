class Restaurant < ActiveRecord::Base

  has_many :selected_restaurants
  has_many :groups, -> { uniq }, :through => :selected_restaurants

  def self.find_by_name(name)
    GooglePlaces.find_restaurant_by_name(name)
  end

  def self.find_by_popularity(latitude, longitude)
    GooglePlaces.find_restaurant_by_popularity(latitude, longitude)
  end

end
