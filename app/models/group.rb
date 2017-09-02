class Group < ActiveRecord::Base
  has_many :group_memberships
  has_many :users, -> { uniq }, :through => :group_memberships
  has_many :selected_restaurants
  has_many :restaurants, -> { uniq }, :through => :selected_restaurants

  validates :zip_code, presence: true
  validates :name, presence: true

  after_create :geocode_zip

  def geocode_zip
    unless self.latitude && self.latitude
      coordinates = GooglePlaces.geocode_zip(self.zip_code)
      self.latitude = coordinates[:latitude]
      self.longitude = coordinates[:longitude]
      self.save!
    end
  end
end
