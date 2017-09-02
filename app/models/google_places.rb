class GooglePlaces

  @@key = "AIzaSyAO95UzCT8ES3ElLoXkeYHAzGHy1rVV5ys"
  #chapel hill lat/long: 35.9333° N, 79.0333° W

  def self.test
    # https://maps.googleapis.com/maps/api/place/textsearch/xml?query=restaurants+in+Sydney&key=AIzaSyAO95UzCT8ES3ElLoXkeYHAzGHy1rVV5ys
    # https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=35.933333,-79.033333&radius=500&types=food&key=AIzaSyAO95UzCT8ES3ElLoXkeYHAzGHy1rVV5ys
    # https://maps.googleapis.com/maps/api/place/textsearch/xml?query=restaurants+in+Chapel+Hill+NC&key=AIzaSyAO95UzCT8ES3ElLoXkeYHAzGHy1rVV5ys
    test_output = HTTParty.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=35.933333,-79.033333&radius=500&types=food&key=AIzaSyAO95UzCT8ES3ElLoXkeYHAzGHy1rVV5ys')

    puts test_output.pretty_inspect
  end

  def self.find_restaurant_by_name(name)
    # url = "https://maps.googleapis.com/maps/api/place/textsearch/xml?query=restaurants+in+Chapel+Hill+NC&name=#{name}&key=AIzaSyAO95UzCT8ES3ElLoXkeYHAzGHy1rVV5ys"
    name.gsub!(' ','+')
    name.strip!
    HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=35.933333,-79.033333&radius=5000&types=food&name=#{name}&key=AIzaSyAO95UzCT8ES3ElLoXkeYHAzGHy1rVV5ys")
  end

  def self.find_restaurant_by_popularity(latitude, longitude)
    HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=5000&types=food&rankby=prominence&key=AIzaSyAO95UzCT8ES3ElLoXkeYHAzGHy1rVV5ys")
  end

  def self.geocode_zip(zip)
    resp = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{zip}&key=AIzaSyAO95UzCT8ES3ElLoXkeYHAzGHy1rVV5ys")
    coordinates = {}
    resp = resp.parsed_response['results'].first
    puts resp['geometry']['location'].pretty_inspect
    coordinates[:latitude] = resp['geometry']['location']['lat']
    coordinates[:longitude] = resp['geometry']['location']['lng']
    puts coordinates
    return coordinates
  end


end
