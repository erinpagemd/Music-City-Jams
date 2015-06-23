class User < ActiveRecord::Base
  ROLES = %w[band fan]

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :gigs
  has_many :comments

  authenticates_with_sorcery!


  validates :email, :name, presence: true
  validates :name, length: {minimum: 3}
  validates :email, format: {with: /.+@.+\..+/, message: "must be an email address"}, uniqueness: true
  validates :password, confirmation: true
  validates :password, :password_confirmation, presence: {on: :create}

  ROLES.each do |role|
    define_method "#{role}?" do
      self.role == role
    end
  end

  protected

  # def method_missing(method_name, *args, &block)
  #   if method_name.match(/(.*)\?/)
  #     if ROLES.include?($1)
  #       return role == $1
  #     end
  #   end
  #
  #   super
  # end
end
