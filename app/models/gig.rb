class Gig < ActiveRecord::Base
  belongs_to :user
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]


  delegate :name, to: :user, prefix: true

end
