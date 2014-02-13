class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates_uniqueness_of :user, scope: [:voteable_id, :voteable_type]
end