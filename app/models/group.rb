class Group < ActiveRecord::Base
  has_many :group_memberships
  has_many :users, -> { uniq }, :through => :group_memberships
  has_many :selected_restaurants
  has_many :restaurants, -> { uniq }, :through => :selected_restaurants
end
