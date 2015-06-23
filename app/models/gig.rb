class Gig < ActiveRecord::Base
  belongs_to :user
  extend FriendlyId

  VALID_TIMELINES = {
    upcoming: 'date >= ?',
    past: 'date < ?',
    today: 'date = ?'
  }

  friendly_id :name, use: [:slugged, :finders]

  has_many :comments

  delegate :name, to: :user, prefix: true

  scope :by_timeline, ->(timeline) {
    self.send(timeline) if valid_timelines.include?(timeline.to_sym)
  }

  def self.valid_timelines
    VALID_TIMELINES.keys
  end

  # class << self
  #   def valid_timelines
  #     VALID_TIMELINES.keys
  #   end
  #
  #   VALID_TIMELINES.each do |timeline, predicate|
  #     define_method timeline do
  #       where(predicate, Date.today).order('date')
  #     end
  #   end
  # end
end
