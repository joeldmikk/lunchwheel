class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :group_memberships
  has_many :groups, -> { uniq }, :through => :group_memberships
end
