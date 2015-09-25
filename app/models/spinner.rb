class Spinner

  def self.spin
    restaurants = Restaurant.all
    r = Random.rand(restaurants.length - 1)
    restaurants[r]
  end

end