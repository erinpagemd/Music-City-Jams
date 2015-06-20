class Fan < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  authenticates_with_sorcery!

  validates :email, present: true
  validates :email, format: {with: /.+@.+\..+/, message: 'must be an email address'},
  validates :password, confirmation: true
  validates :password, :password_confirmation, presence: {on: :create}
end
